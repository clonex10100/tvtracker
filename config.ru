require './config/environment'

use Rack::MethodOverride
use UserController
use ShowController
use TagController
use AccountController
use CategoryController
run ApplicationController
