int ego()
{
	bool NEARFOE=CHECKNEARFOE();
	//CloneBombs
	if(abs(self.x - target.x) < 20 || abs(self.z - target.z) < 5 )
	{
		if (self.mp >= 300)
		{
			DuA();
		}
		if (self.mp >= 150)
		{
			DdA();
		}
	}
	//Doppelgänger Attacks
	if (self.mp >= 75 && target.state != 14)
	{
		//Doppelgänger Attacks - Send Clone
		if ((self.x-target.x) < -80 && (self.x-target.x) > -120 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			right(1,0);
			DdJ();
		}else if ((self.x-target.x) > 80 && (self.x-target.x) < 120 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			left(1,0);
			DdJ();
		}
		//Doppelgänger Attacks - Send Self
		if ((self.x-target.x) < -20 && (self.x-target.x) > -80 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			right(1,0);
			DdJ();
		}else if ((self.x-target.x) > 20 && (self.x-target.x) < 80 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			left(1,0);
			DdJ();
		}		
	}	
	//Trap
	if(NEARFOE == false && self.mp >= 150)
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
	//Illusion Blast
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
	return 0;
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