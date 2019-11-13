require_relative './config/environment'

use Rack::MethodOverride
use UserController
use ShowController
use AccountController
run ApplicationController
