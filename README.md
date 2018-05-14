# GA Project 1: Rails - Generative Art CRUD system
## Generative Art with javascript and p5.js
### See the [live version](https://gen-art.herokuapp.com/)
## Requirements
ruby, rails and postgresql (you will need your own postgresql server running)
## Installation
After cloning this repository to your own machine, in the root of the project directory run:
```
bundle
```
```
rails db:schema:load
```
```
rails db:seed
```
## To build the project and start the server:
```
rails s
```
## Project Details
### Models
There are four models **Users** **Presets** **Comments** **Ratings** 

A user has many presets and many comments >> 

A preset belongs to a user and has many comments and ratings >> 

A comment belongs to a preset and a user >> 

A rating belongs to a preset
### User Authentication
Uses **bcrypt gem** for password encryption and my own rolled methods for user authentication
### Tricky Bits
Some helper methods in presets_controller to help with ratings, comments and preset forking all working from the one controller.

### Libraries
**[p5.js](https://p5js.org/)** was used for generating the graphics for the presets 
**[Bulma](https://bulma.io/)** was used for CSS styling 

## TODOs
- [ ] Ratings system is incomplete/broken
- [ ] Make a 'following' system
- [ ] More features for comments such as comment replies 
- [ ] Possibly rework entire front end, use CRUD system and back end for users to upload any digital art they like
## License
MIT - see license file



