int ego()
{
	bool CAUGHTFOE = CHECKCATCH();
	//Grab
	if (CAUGHTFOE == false && self.mp >= 50 &&(self.x-target.x) < -10 && (self.x-target.x) > -200 && abs(self.z-target.z) < 5 && target.y > -5 && target.state != 14)
	{
		right(1,0);
		DJA();
	}else if (CAUGHTFOE == false && self.mp >= 50 && (self.x-target.x) > 10 && (self.x-target.x) < 200 && abs(self.z-target.z) < 5 && target.y > -5 && target.state != 14)
	{
		left(1,0);
		DJA();
	}
	//CrashPunch OR UpperCut
	int CHOOSE = rand(2); //0 = CrashPunch, 1 = UpperCut
	switch(CHOOSE)
	{
		case 0:
		//CrashPunch
		if ((self.x-target.x) < -10 && (self.x-target.x) > -80 && abs(self.z-target.z) < 5 && target.y > -5 && target.state != 14)
		{
			DrA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 80 && abs(self.z-target.z) < 5 && target.y > -5 && target.state != 14)
		{
			DlA();
		}
		break;
		case 1:
		//UpperCut
		if ((self.x-target.x) < -10 && (self.x-target.x) > -80 && abs(self.z-target.z) < 5 && target.y > -5 && target.state != 14)
		{
			right(1,0);
			DuA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 80 && abs(self.z-target.z) < 5 && target.y > -5 && target.state != 14)
		{
			left(1,0);
			DuA();
		}
		break;
	}
	//GrabExclusiveMoves
	if(CAUGHTFOE == true)
	{
		//Relentless
		if(self.mp >= 250)
		{
			DdA();
		}
		//PowerThrow
		if(self.mp >= 100)
		{
			DuJ();
		}
	}
	return 0;
}

bool CHECKCATCH()
{
	if(self.frame >= 120 && self.frame <= 124)
	{
		return true;
	}
	else
	{
		return false;
	}
}
