# AschesLF2
AI and stuff for a game I'm working on, AschesLF2; a mod for the fighting game, Little Fighter 2.

In my mod, I have created several new characters with unique playstyles not available in the original game. As such, a custom AI is required. Here, I write the AI for them.

I am using mostly int ego() in my code, which is constantly called by the default AI, and will return control to the default AI after running. This allows me to define specific conditions in which my AI will take over; for instance, when a skill should be used (default AI does not understand custom skills).

<b>Healers</b>

In addition to the commonplace feature of being able to detect allies who need to be healed, I have invented two features which I think are quite new and unique: SAVEMP and CHECKHEAL.

SAVEMP allows the healer AI to better manage its MP (Mana Points, a resource required for skills, which regenerates over time); if active, when healing is not needed, although the AI will use offensive skills, they will always ensure that they conserve enough MP to immediately use a heal in case of emergencies. This feature can be disabled on easy mode, or if the AI is the last man standing on its team.

CHECKHEAL allows the AI to check if there is already a heal that has been used, but not yet consumed. It prevents cases of the AI healing when someone else is already doing so, or healing twice consecutively when only once is required.

<b>Asche</b>

Asche is the first custom character I made for this mod. He is a supportive damage dealer who deals damage from long distances using others as a conduit, but suffers from long delays and HP costs. His signature move, "Spontaneous Combustion", creates an explosion directly at the current position of the nearest enemy after a delay and a warning shot. As such, although it is normally easy to avoid, it is effective against targets who can't move, for instance, those who are engaged in combat or attempting to use their own skills.

My AI can analyse potential targets, and determine the best times to use "Spontaneous Combustion". I have also set it to scale with difficulty; on easy, it will spam indiscriminately, while it will demonstrate its maximum proficiency on difficult mode.

<b>Moeyy</b>

Although Moeyy's skills are unconventional and made for a 'tricky' playstyle, it was surprisingly straightforward to program the AI. It should be pretty much self-explanatory.

<b>Janice</b>

Janice is an easy-to-use healer character, so the AI is quite straightforward and self-explanatory.

<b>Markus</b>

Markus is a brawler. He specialises in 'grab' attacks, and gains access to more powerful manuvers if he successfully grabs his opponent. As such, the AI is programmed to check if he is currently grabbing the opponent, and utilise the 'grab exclusive' manuvers if so. Otherwise, the AI will attempt to grab the opponent, or fight normally.

<b>Bart</b>

Bart, like Janice, is capable of healing. However, he differs in two main aspects.

Firstly, his skills take significantly longer to use. As such, I created a CHECKNEARFOE function to check if enemies are nearby before attempting to use skills that might be interrupted (Not applicable to easy mode). Secondly, he is able to cancel his skills before they are completed. As such, a check to ensure that he isn't currently using a skill before starting another skill is required, so that he does not end up wasting MP excessively by constantly cancelling his own skills.

<b>Richie</b>

Richie's AI is probably the most complicated one. He is powerless without items, however, he can create his own items, and gain different skills depending on his equipped items. As such, the AI is programmed to firstly check if he has an item, and to randomly create one if he does not. It is also programmed to act differently depending on what item he has on hand.

<b>Luce</b>

Luce is a fast paced character who excels in combos, and has a unique trait, "Resonance", which reduces the MP cost of skills if they are used in quick succession at the right timing. As such, when attempting to perform a skill, not only does the AI check whether it has enough MP, it also checks if it is eligible for MP cost reduction, and if so, if it would have enough MP after the cost reduction.

<b>Stage Bosses</b>

<u>Stage 1</u>

I wanted to try something new with stage bosses: having them change attack patterns each time they are defeated. I also wanted the attack patterns to vary depending on the difficulty. As such, my code has the boss use a skill depending on the stage and phase. Within each of the boss' skills, there is an option to press Attack/Jump/Defend at the right moment to increase the projectiles/speed of the skill, and the boss is coded to press the appropriate key depending on the difficulty.

<u>Stage 2 has no unique AI</u>
Stage 2 does not feature a unique AI. This is because stage 2 is made differently; the player will rescue hostages throughout the stage, and lead their group to defeat the enemies. The 'final boss' is, in fact, a large group of enemies who use default AI.

<u>Stage 3</u>

Stage 3's boss fights just like any other character. However, in the later phases, he will use upgraded versions of his moves by pressing 'Attack' or 'Jump' at the right moment. There's also something special for that final phase...

<b>Minions</b>

Minions are the weak, lesser enemies that you'll sometimes encounter during the stage. They have fewer moves, and less complicated AI.
