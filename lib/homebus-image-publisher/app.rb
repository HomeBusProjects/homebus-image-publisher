require 'homebus'
require 'json'

require 'net/http'
require 'base64'
require 'timeout'

require 'pp'

class HomebusImagePublisher::App < Homebus::App
  DDC_IMAGE = 'org.homebus.experimental.image'
  CONFIG_FILE = '.homebus-image-publisher.json'

  def initialize(options)
    @options = options

    super
  end

  def setup!
    sources = JSON.parse(File.read(CONFIG_FILE), symbolize_names: true)

    @devices = []
    sources.each do |source|
      device = Homebus::Device.new name: source[:name],
                                   manufacturer: 'Homebus',
                                   model: 'Image publisher',
                                   serial_number: source[:url]

      devices.push device
    end
  end

  def update_interval
    60
  end

  def work!
    threads = []

    @devices.each do |device|
      threads << Thread.new do
        image = _get_image(device.serial_number)

        if image
          device.publish! DDC_IMAGE, image
          if @options[:verbose]
            puts "got image from #{device.name}"
          end
        else
          puts "image failed for #{device.name}"
        end
      end
    end

    threads.each { |thr| thr.join }

    sleep update_interval
  end

  def name 
    'Homebus image publisher'
  end

  def publishes
    [ DDC_IMAGE ]
  end

  def devices
    @devices
  end

  def _get_image(url)
    begin
      response = Timeout::timeout(30) do
        uri = URI(url)
        response = Net::HTTP.get_response(uri)
      end

      if response.code == "200"
        return {
          mime_type: 'image/jpeg',
          data: Base64.encode64(response.body)
        }
      else
        nil
      end
    rescue
      puts "timeout"
      nil
    end
  end

end
