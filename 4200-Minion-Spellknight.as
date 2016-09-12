int ego()
{
	int FOE = loadTarget(target.num);
	int BLOCKCHANCE=rand(4); //easy = 25%, normal = 50%, difficult = 75% crazy = 100%
	if ((BLOCKCHANCE - difficulty) >= 1 && self.mp >= 100)
	{
		for(int n=0; n<400; n++)
		{
			if(loadTarget(n) == 3 && target.team != self.team && target.state == 3000 && target.x_velocity != 0)
			{
				if ((self.x-target.x) < -50 && (self.x-target.x) > -300 && abs(self.z-target.z) < 5 && target.y > -50)
				{
					DrJ();
				}
				else if ((self.x-target.x) > 50 && (self.x-target.x) < 300 && abs(self.z-target.z) < 5 && target.y > -50)
				{
					DlJ();
				}
			}
		}
	}
	loadTarget(FOE);
	if ( self.mp >= 350 && (self.dark_hp-self.hp) >= 100 )
	{
		bool NEARFOE=CHECKNEARFOE();
		if(NEARFOE == false)
		{
			DdJ();
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
