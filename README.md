## cryptology
A collection of simple ruby scripts implementing rudimentary cryptographic analysis concepts
* rvm (rvm.io)
* ruby interpreter (2.0+)
* required gems (see Gemfile)
* linux terminal

Setup usage with rvm and process event series:
* create a gemset
`$ rvm gemset create <gemset>`
eg. `$ rvm gemset create cryptology`
* use created gemset
`$ rvm <ruby version>@<gemset>`
* install bundler gem
`$ gem install bundler`
* install necessary gems
`$ bundle`
* make scripts executable
`$ chmod +x <script_name.rb>`
* run script
`$ ./<script_name.rb>`

Further Development [coming soon...]
* frequency analysis attack
* kasiski attack  
* AES encryption
* more ...
