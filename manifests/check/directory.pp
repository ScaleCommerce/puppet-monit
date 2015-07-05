define monit::check::directory(
  # Check type specific.
  $path,
  $template   = 'monit/check/directory.erb',

  # Common parameters.
  $ensure     = present,
  $group      = $name,
  $alerts     = [],
  $noalerts   = [],
  $tests      = [],
  $depends    = [],
  $priority   = '20',
  $bundle     = $name,
  $order      = 0,
) {
  validate_absolute_path($path)

  monit::check::instance { "${name}_instance":
    name     => $name,
    ensure   => $ensure,
    type     => 'directory',
    priority => $priority,
    bundle   => $bundle,
    order    => $order,
    template => $template,
    tests    => $tests,
  }
}

