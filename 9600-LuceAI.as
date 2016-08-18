int ego()
{
	bool MPCOSTDOWN = RESONANCE(self.frame);
	//speedkick
	if (self.mp >= 75 || (MPCOSTDOWN == true && self.mp >= 50) )
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -80 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DrA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 80 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DlA();
		}
	}
	//highkick
	if (self.mp >= 75 || (MPCOSTDOWN == true && self.mp >= 50) )
	{
		if ((self.x-target.x) < -1 && (self.x-target.x) > -30 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			right(1,0);
			DuA();
		}else if ((self.x-target.x) > 1 && (self.x-target.x) < 30 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			left(1,0);
			DuA();
		}
	}
	//Pillar
	if ( (self.mp >= 350 || (MPCOSTDOWN == true && self.mp >= 275) ) && abs(self.x-target.x) <= 30 && abs(self.z-target.z) <= 5)
	{
		DuJ();
	}
	//laser
	if (self.mp >= 150  || (MPCOSTDOWN == true && self.mp >= 100) )
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DrA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DlA();
		}
	}
	//selfheal
	if ( (self.mp >= 350 || (MPCOSTDOWN == true && self.mp >= 275) ) && (self.dark_hp-self.hp) >= 100 )
	{
		bool NEARFOE=CHECKNEARFOE();
		if(NEARFOE == false)
		{
			DdJ();
		}
	}
	return 0;
}

bool RESONANCE(int FRAME)
{
	switch(FRAME)
	{
		case 236: case 237: //laser
		case 242: case 243: //highkick
		case 252: case 253: //speedkick
		return true;
		default:
		if((FRAME >= 265 && FRAME <= 272) || (FRAME >= 285 && FRAME <= 292)) //pillar, selfheal
		{
			return true;
		}else
		{
			return false;
		}
	}
	return false;
}

bool CHECKNEARFOE() // check if enemies are nearby, only on normal or higher
{
	if ((abs(self.x - target.x) < 100 || abs(self.z - target.z) < 20 ) && difficulty != 2)
	{
		return true;
	}
	else
	{
		return false;
	}
}
