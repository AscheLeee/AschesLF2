int ego()
{
	//breathe fire
	if (self.mp >= 125 && target.state != 14)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -110 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			right(1,0);
			DdJ();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 110 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			left(1,0);
			DdJ();
		}
	}
	//ball
	if (self.mp >= 50 && target.state != 14)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -400 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DrA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 400 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DlA();
		}
	}
	//disk
	if (self.mp >= 200)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -300 && abs(self.z-target.z) < 15)
		{
			DrJ();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 300 && abs(self.z-target.z) < 15)
		{
			DlJ();
		}
	}
	//kick
	if (self.mp >= 100  && target.state != 14)
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
	return 0;
}