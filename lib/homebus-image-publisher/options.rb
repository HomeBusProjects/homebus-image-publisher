require 'homebus'

require 'homebus-image-publisher/version'

class HomebusImagePublisher::Options < Homebus::Options
  def app_options(op)
    provision_help = 'homebus-image-publisher provision'
    add_help       = 'homebus-image-publisher add URL'
    remove_help    = 'homebus-image-publisher remove URL|#'
    list_help      = 'homebus-image-publisher list'
    run_help       = 'homebus-image-publisher run [--verbose]'


    op.separator 'image publisher options:'
#    op.on('provision', '', provision_help) { |value| ImagePublisherHomebusApp.provision }
    op.separator ''
#    op.on('add', '', add_help) { |value| ImagePublisherHomebusApp.add(value) }
#    op.on('remove', '', remove_help) { |value| ImagePublisherHomebusApp.remove(value) }
#    op.on('list', '', list_help) { |value| ImagePublisherHomebusApp.list }
    op.separator ''
#    op.on('run', '', run_help) { |value| ImagePublisherHomebusApp.run!(value) }
    op.separator ''
  end

  def banner
    'HomeBus image publisher'
  end

  def version
    HomebusImagePublisher::VERSION
  end

  def name
    'homebus-image-publisher'
  end
end
