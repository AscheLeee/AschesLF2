# AschesLF2
AI and stuff for a game I'm working on, AschesLF2; a mod for the fighting game, Little Fighter 2.

In my mod, I have created several new characters with unique playstyles not available in the original game. As such, a custom AI is required. Here, I write the AI for them.

I am using mostly int ego() in my code, which is constantly called by the default AI, and will return control to the default AI after running. This allows me to define specific conditions in which my AI will take over; for instance, when a skill should be used (default AI does not understand custom skills).

<b>Healers</b>

In addition to the commonplace feature of being able to detect allies who need to be healed, I have invented two features which I think are quite new and unique: SAVEMP and CHECKHEAL.

SAVEMP allows the healer AI to better manage its MP (Mana Points, a resource required for skills which regenerates over time); if active, when healing is not needed, although the AI will use offensive skills, they will always ensure that they conserve enough MP to immediately use a heal in case of emergencies. This feature can be disabled on easy mode, or if the AI is the last man standing on its team.

CHECKHEAL allows the AI to check if there is already a heal that has been used, but not yet consumed. It prevents cases of the AI healing when someone else is already doing so, or healing twice consecutively when only once is required.

<b>Asche</b>

Asche is the first custom character I made for this mod. He is a supportive damage dealer who deals damage from long distances using others as a conduit, but suffers from long delays and HP costs. His signature move, "Spontaneous Combustion", creates an explosion directly at the current position of the nearest enemy after a delay and a warning shot. As such, although it is normally easy to avoid, it is effective against targets who can't move, for instance, those who are engaged in combat or attempting to use their own skills.

My AI can analyse potential targets, and determine the best times to use "Spontaneous Combustion". I have also set it to scale with difficulty; on easy, it will spam indiscriminately, while it will demonstrate its maximum proficiency on difficult mode.

<b>Janice</b>

Janice is an easy-to-use healer character, so the AI is quite straightforward and self-explanatory.

<b>Bart</b>

Bart, like Janice, is capable of healing. However, he differs in two main aspects.

Firstly, his skills take significantly longer to use. As such, I created a CHECKNEARFOE function to check if enemies are nearby before attempting to use skills that might be interrupted (Not applicable to easy mode). Secondly, he is able to cancel his skills before they are completed. As such, a check to ensure that he isn't currently using a skill before starting another skill is required. 
