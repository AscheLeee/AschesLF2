int ego()
{
	//Stay within screen
	if(self.x > stage_bound)
	{
		left(1,0);
		left(1,0);
	}
	else if(self.x < 0)
	{
		right(1,0);
		right(1,0);
	}
	else if ((stage_bound - self.x) > 50 || self.x  > 50)
	{
		left(0,0);
		right(0,0);
	}
	RESET();
	//SC1 - Use as Midboss
	if(current_stage == 2 && self.state == 0 && self.x < 890 && self.x > 10 && self.mp >= 75)
	{
		if((self.x-target.x) < 0)
		{
			DrA();
		}
		else
		{
			DlA();
		}
		RESET();
	}
	SPELLCARD(240); //SC1 difficulty
	//Final Boss
	if(current_stage == 4 && self.state == 0 && self.x < 890 && self.x > 10)
	{
		switch(current_phase)
		{
			case 1: //Combustion
			if((self.x-target.x) < 0)
			{
				DrJ();
			}
			else
			{
				DlJ();
			}
			RESET();
			break;
			case 2: //Swirling Ash
			DdA();
			RESET();
			break;
			case 3: //Finale
			DJA();
			RESET();
			break;
		}
	}
	SPELLCARD(252); //Combustion difficulty
	SPELLCARD(273); //Swirling Ash Difficulty
	SPELLCARD(293); //Finale Difficulty
return 0;
}

void SPELLCARD(int FRAME) //Toggle difficulty of spellcard
{
		switch(difficulty)
		{
			case 1:
			if(self.frame == FRAME)
			{
				A(1,0);
			}
			break;
			case 0:
			if (self.frame == FRAME)
			{
				J(1,0);
			}
			break;
			case -1:
			if (self.frame == FRAME)
			{
				D(1,0);
			}
			break;
		}
	RESET();
}

void RESET() //Reset DJA inputs
{
	A(0,0);
	J(0,0);
	D(0,0);
}
