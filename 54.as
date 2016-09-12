int ego()
{
	RESET();
	if(current_phase != 5 || self.team != 5)
	{
		SKILLS();
		ATTACKLEVELS();
		return 0;
	}
	else if(self.team == 5 && current_phase == 5) //SelfDetonate
	{
		if(self.frame < 310)
		{
			DJA();
		}
		return 1;
	}
	return 0;
}

void SKILLS()
{
	//DaoistPalm
	if (self.mp >= 75 && target.state != 14)
	{
		if ((self.x-target.x) < -20 && (self.x-target.x) > -220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DrA();
		}else if ((self.x-target.x) > 20 && (self.x-target.x) < 220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DlA();
		}
	}
	//AreaAtk
	if ( (self.mp >= 200 && abs(self.x-target.x) <= 30 && abs(self.z-target.z) <= 5 && target.state != 14) )
	{
		DuJ();
	}
	//HomingAtk
	if (self.mp >= 300 && target.state != 14)
	{
		if ((self.x-target.x) < -20 && (self.x-target.x) > -300)
		{
			DrJ();
		}else if ((self.x-target.x) > 20 && (self.x-target.x) < 300 )
		{
			DlJ();
		}
	}
}

void RESET() //Reset DJA inputs
{
	A(0,0);
	J(0,0);
	D(0,0);
}

void ATTACKLEVELS()
{
	switch(self.frame)
	{
		case 242: case 272: case 282:
		AORJ();
		break;
	}

}

void AORJ()
{
	switch(current_phase)
	{
		case 3:
		A(1,0);
		break;
		case 4:
		J(1,0);
		break;
	}

}