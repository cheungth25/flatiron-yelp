$:.unshift '.'
require 'config/environment'

use Rack::MethodOverride
use ReviewController
run ApplicationController
