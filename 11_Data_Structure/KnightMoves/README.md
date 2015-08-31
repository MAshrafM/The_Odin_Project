<h1>The Odin Project</h1>
<h2> Project#11 : Basic Data Structures and Algorithms</h2>
<h3><a href="http://www.theodinproject.com/ruby-programming/data-structures-and-algorithms">Project#11.2 : Knight's Travails</a></h3>
<p>A knight in chess can move to any square on the standard 8x8 chess board from any other square on the board, given enough turns . Its basic move is two steps forward and one step to the side. It can face any direction.</p>
<p>Task: </p>
<ul>
<li>Put together a script that creates a game board and a knight.</li>
<li>Treat all possible moves the knight could make as children in a tree. Don't allow any moves to go off the board.</li>
<li>Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.</li>
<li>Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square.</li>
</ul>
<p>Board is build with linked cells available for knight</p>
<p>BFS to find the path for the knight from source to target</p>
<p>It find the path from source to target put not the shortest all the time
as it didn't get the shortest from [3,3]>[4,3]</p>
<p>Future fix to find always shortest</p>
<p>Future try other algorithms</p>