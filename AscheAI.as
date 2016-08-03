int ego()
{
	//Self-Immolation
	if (self.hp > 300 && self.mp < 300 && (abs(self.x - target.x) > 200 || abs(self.z - target.z) > 100 || difficulty == 2 ))
	{
		DdJ(); //Begin Self-Immolation
	}
	if (self.frame == 254 )
	{
		if (self.hp > 300 && self.mp < 350 && (abs(self.x - target.x) > 200 || abs(self.z - target.z) > 100 || difficulty == 2 ))
		{
			A(1,0);
		}else
		{
			D(1,0);
		}
	}
	if (self.frame == 256)
	{
		A(1,0);
	}

	//Spontaneous Combustion
	if (self.mp >= 125)
	{
		if (difficulty == 2) //Easy - Anyhow spam
		{
			COMBUST();
		}
		if (difficulty == 1) //Normal - use when target isn't running
		{	
			if (target.frame < 9 || target.frame > 11)
			{
				COMBUST();
			}
		}
		if (difficulty <= 0) //hard or crazy - wait for the right moment
		{
			if (target.frame > 11)
			{
				COMBUST();
			}
		}
	}
	//Swirling Ash Self
	if (self.mp >= 300)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -120 && abs(self.z-target.z) < 15)
		{
			right();
			DdA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 120 && abs(self.z-target.z) < 15)
		{
			left();
			DdA();
		}
	}
	//Burning Ash Blast
	if (self.mp >= 75)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DrA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DlA();
		}
	}
return 0;
}

void COMBUST()
{
	if (self.facing == true)
	{
		DlJ();
	}	
	else
	{
		DrJ();
	}
}