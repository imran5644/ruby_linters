# Ruby Capstone Project - Ruby Linter

# About

The whole idea of writing the code to check another code is intriguing at the same time cognitively demanding. Building Linters for Ruby, the project provides feedback about errors or warnings in code little by little. The project was built completely with Ruby following all possible best practices. Rubocop was used as a code-linter alongside Gitflow to ensure I maintain good coding standards.

# The Build

The custom Ruby linter currently checks/detects for the following errors/warnings.

    check for trailing white spaces
    check for missing/unexpected tags i.e. '( )', '[ ]', and '{ }'
    check missing/unexpected end
    check empty line error


Below are demonstrations of good and bad code for the above cases.

## Trailing white spaces

## Good Code
~~~ruby
class Dog
  def initialize(breed, cost)  
    @breed = breed
    @cost = cost  
  end  
end

## Bad Code

class Dog
  def initialize(breed, cost)  
    @breed = breed  
    @cost = cost}
  end
end
~~~

## Missing/Unexpected Tag

## Good Code
~~~ruby
class Dog
  def initialize(breed, cost)  
    @breed = breed
    @cost = cost
  end
end

## Bad Code

class Dog
  def initialize(breed, cost)  
    @breed = breed  
    @cost = cost}
  end
~~~
## Missing/unexpected end

## Good Code
~~~ruby
class Dog
  def initialize(breed, cost)  
    @breed = breed
    @cost = cost
  end
 end

## Bad Code
class Dog
  def initialize(breed, cost)  
    @breed = breed
    @cost = cost
  end
~~~

## Empty line error

## Good Code
~~~ruby
class Dog
  def initialize(breed, cost)  
    @breed = breed
    @cost = cost
  end
  def dog_food(quantity)
    quantity.each do |item|
      puts item
    end
end
end
## Bad Code
class Dog
  def initialize(breed, cost)  
    @breed = breed
    @cost = cost
  end

  def dog_food(quantity)
    quantity.each do |item|
      puts item
    end
end
end
~~~
## Built With
- Ruby
- RSpec for Ruby Testing


# Getting Started

To get a local copy of the repository please run the following commands on your terminal:


$ cd <folder>



$ git clone https://github.com/imran5644/ruby_linters.git

$ bundle install

To run local copy of the repository please run the following commands on your terminal:

~~bash
$  ruby test.rb


## Testing

To test the code, run rspec from root of the folder using terminal. Note: bug.rb has been excluded from rubocop checks to allow RSpec testing without interfering with Gitflow actions

    Rspec is used for the test, to install the gem file,

    But before that, make sure you have bundler installed on your system, else run

$ gem install bundler or you simply install the the following directly using

$ gem install rspec 

$ gem install colorize 

$ run rspec


## Authors

👤 **Imran Yousaf** 

- Github: [@imran5644](https://github.com/imran5644)
- Twitter: [@imran56444](https://twitter.com/imran56444)
- Linkedin: [Imran Yousaf](https://www.linkedin.com/in/imran-yousaf-8777297b/)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/NataJenkins/TicTacToe/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- The Odin Project[https://www.theodinproject.com/courses/ruby-programming/]

## 📝 License

This project is [MIT](lic.url) licensed.
## Acknowledgments

Project inspired by Microverse
