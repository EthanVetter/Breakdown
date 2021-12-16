# BREAKDOWN
by Ethan Vetter
#### Video Demo: https://youtu.be/ug9eEv1Ao-E
#### Description:

Breakdown is a game coded in lua and made for LOVE2D. It takes heavy inspiration from the classic game Breakout. The objective of the game is to use your paddle to volley a ball towards the right side of the screen to eliminate bricks.
Once all bricks are destroyed, you win! However as the longer the game goes on the more challenging it gets. The ball will speed at different intervals depending on what it collides with.
The paddle itself will add a set amount of speed each time. While the bricks have varied speeds depending on how far back they are, with each row increasing the speed further and further.
You are given five lives before you get a gameover and have to restart from the beginning.

My basis for the game's code came from what I used to consider a mistake but have since realized it was probably the thing that helped me the most. I started this course last year and reached the game's track.
I was under the impression that I would have to code both Pong and Mario along with the videos shown. I didn't realize this mistake until about halfway through Mario.
Thankfully coding Pong gave me much needed insight on how to go about not only this project, but coding for LOVE2D as a whole. In a way this game is a mixture of Pong and Breakout.
I don't think this game is coded perfectly by any means and could probably use several optimizations. I coded about 90% of it without any research or help. The last ten is some research I had to do.

My main file is easily the largest and most intricate. This is where my game calls for it's different states, sound effects, score, deaths, etc. This what I easily put the most time into, and I feel like the 600+ lines of code prove that.
I went with a retro style font and a navy blue and orange to fit with the graphics and my favorite color choices respectively. My biggest hurdle was figuring out how to make a single brick go away when it was interacted with.
After several failed attempts and crashes I finally figured it out. By moving the brick and making it a have size of zero it wouldn't technically be gone, but would appear as if it was.
I also created sound effects for specific actions such as the ball bouncing off specific objects, the ball going off screen, and winning the game.

My ball, brick, and paddle files are all class files which state what they exactly are. I was able to take inspiration from Pong for the ball and paddle but brick was created entirely by my knowledge from learning from the other two.
The ball file is the most complicated with it determining it's physics and speed which are much easier said than done. I don't yet have the knowledge to implement a fully fledged physics system.
I instead made a somewhat simple system that would make the game different every time it's played while not being completely random. Thankfully brick and paddle were fairly similar.

One of the biggest helps of this has been getting my girlfriend to playtest the game and give her feedback. Originally the game was going to be a bit less refined due to me not seeing issues from staring at it for hours on end.
For example: I originally thought the game was too easy so I had the starting lives set to three. When she played however she found the game too difficult and couldn't win after several attempts.
After refining the physics, changing speed values, and bumping up the life count to five it was in a much better place. I even implemented a simple cheat code to grant extra lives as sort of an "easy mode".
