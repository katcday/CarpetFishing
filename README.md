# Carpetfishing
 A game made in processing. You are a bored office worker, who sees something in his carpet. You are quickly captured by your dreams of catching the elusive Mr. Marlin.


<p align="center">
  <img src="https://github.com/katcday/Carpetfishing/blob/main/Screenshots/Carpetfishing%20Captures/Screenshot%20(8).png">
</p>

## Instructions
To play the game you need Processing downloaded on your computer and to run the files as a sketch. In the CarpetFishing folder you will find carpetfishing and collisiondemo. They are two different sketches. Carpetfishing is the game, and collisiondemo is the demo version of the game with no fun fish graphics.

## Why Carpetfishing?
We were given a Dilbert comic and a couple of days to game jam a fishing based game. I stuck to the theme of the comic and drew an office worker bored at work. I then thought back to my favorite arcade game. You would roll a ball and try to eat as many fish as you could without getting eaten by any fish that were bigger than you. I decided that I wanted to make something similar.

## Gameplay
The game starts with your fish on a wire. You're trying to eat the fish coming from the left while avoiding the fish on the left, as they will eat you.

<p align="center">
  <img src="https://github.com/katcday/Carpetfishing/blob/main/Screenshots/Carpetfishing%20Captures/Screenshot%20(9).png">
</p>

As you eat more fish you will grow, and so will the fish around you. With every 10 fish you eat, all fish on screen will grow as well as speed up.

<p align="center">
  <img src="https://github.com/katcday/Carpetfishing/blob/main/Screenshots/Carpetfishing%20Captures/busy.png">
</p>

Once you hit 700 points, Mr. Marlin will swim out. Once you let him eat you, your fisherman has caught the big guy and you win

<p align="center">
  <img src="https://github.com/katcday/Carpetfishing/blob/main/Screenshots/Carpetfishing%20Captures/mr%20marlin%20enters.png">
</p>

Nice.

<p align="center">
  <img src="https://github.com/katcday/Carpetfishing/blob/main/Screenshots/Carpetfishing%20Captures/success.png">
</p>

## Extras
If you somehow aren't good enough at the game, yet are dying to see Mr. Marlin, you can press m on your keyboard to summon him.

Once you hit the end screen, you can press enter to play again.

## Stages of Developpment
Since I wasn't used to coding with Processing or making games, I decided to start with a simple version of the games. It was basically the same, but with circles instead of fish. I worked on programming the collisions and getting the feel for the game down.

<p align="center">
  <img src="https://github.com/katcday/Carpetfishing/blob/main/Screenshots/Carpetfishing%20Captures/Screenshot%20(10).png">
</p>

After getting the demo working, I added the graphics and the cutscenes at the end and beginning of the game. I quickly realized that the collisions for circles didn't feel right when I used the fish images. I quickly switched to hitboxes instead.

Another issue I had was that the hitboxes were bounded at the edges of the fish image. This meant that if you were even close to the fish without hitting it, you could still get "eaten". I went for a smaller hitbox that was closer to the fishes mouth. That way you always feel like you deserve your loss.

Finally, after the game was working I spent some time adjusting the balance. Since the game gets increasingly difficult, I wanted to set a reasonable amount of points to get before letting the endscene play. After messing with the timing of the fish and the amount of points needed, I ended up at about 700 points. This made the endgame challenging to reach, but nowhere near impossible.
