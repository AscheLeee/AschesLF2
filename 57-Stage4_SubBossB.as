int ego()
{
	//teleport
	if(self.mp >= 40 && (abs(self.x-target.x) >= 450 || abs(self.z-target.z) >= 300))
	{
		DJA();
	}	
	//nado
	if (self.mp >= 200  && target.state != 14)
	{
		if ((self.x-target.x) < -1 && (self.x-target.x) > -30 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			right(1,0);
			DuJ();
		}else if ((self.x-target.x) > 1 && (self.x-target.x) < 30 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			left(1,0);
			DuJ();
		}
	}	
	//punch
	if (self.mp >= 50  && target.state != 14)
	{
		if ((self.x-target.x) < -1 && (self.x-target.x) > -40 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			right(1,0);
			DdA();
		}else if ((self.x-target.x) > 1 && (self.x-target.x) < 40 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			left(1,0);
			DdA();
		}
	}	
	//ball
	if (self.mp >= 50 && target.state != 14)
	{
		if ((self.x-target.x) < -25 && (self.x-target.x) > -220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DrA();
		}else if ((self.x-target.x) > 25 && (self.x-target.x) < 220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DlA();
		}
	}
	return 0;
}
