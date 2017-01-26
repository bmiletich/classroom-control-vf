class nginx {
  include nginx::packages
  include nginx::config
  include nginx::services
}
