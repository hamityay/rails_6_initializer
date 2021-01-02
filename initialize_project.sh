if [[ "$1" != "" ]]; then
  APP_NAME="$1"
else
  APP_NAME="app_name"
fi

rails new $APP_NAME -d postgresql --webpack=coffee

cd $APP_NAME/

rails db:create

echo ".idea/*" >> .gitignore

git add .

git commit -m "Initial commit"

yarn upgrade coffee-loader@1.0.1

yarn upgrade coffeescript@2.5.1

git add .

git commit -m "Fix coffeescript build"


echo "gem 'haml-rails'" >> Gemfile

bundle install

rails generate haml:application_layout convert

rm app/views/layouts/application.html.erb

HAML_RAILS_DELETE_ERB=true rails haml:erb2haml

git add .

git commit -m "Integrate haml"

yarn add sass style-loader css-loader sass-loader

sed -i "3i const sass = require('./loaders/sass')\nconst scss = require('./loaders/scss')\nconst css = require('./loaders/css')" config/webpack/environment.js

sed -i "7i environment.loaders.prepend('sass', sass)\nenvironment.loaders.prepend('scss', scss)\nenvironment.loaders.prepend('css', css)" config/webpack/environment.js

cp ../sass.js config/webpack/loaders/

cp ../scss.js config/webpack/loaders/

cp ../css.js config/webpack/loaders/

git add .

git commit -m "Add css/sass/scss loaders"

yarn add jquery foundation-sites motion-ui

cp -r ../foundation app/javascript

sed -i '10i import "foundation"' app/javascript/packs/application.js

git add .

git commit -m "Add foundation"

echo "gem 'react-rails'" >> Gemfile

bundle install

rails webpacker:install:react

rails generate react:install

git add .

git commit -m "Add react"


echo "Everything set up. Feel free to delete these two files;\nhello_react.jsx\nhello_coffee.coffee"


