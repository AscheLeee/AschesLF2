int ego()
{
	int FOE = loadTarget(target.num);
	int CHOOSE;
	//Check if holding an item, else try to make an item
	if(self.weapon_held == -1 && self.mp >= 100 && (self.frame < 235 || self.frame > 260))
	{
		DJA();		
	}
	if(self.frame == 237)
	{
		CHOOSE=rand(5); //0 - fire (DuJ), 1 - earth(DdJ), 2 - air(DuA), 3 - water(DdA), 4 - spirit(DfA)
		switch(CHOOSE)
		{
			case 0:
			DuJ();
			break;
			case 1:
			DdJ();
			break;
			case 2:
			DuA();
			break;
			case 3:
			DdA();
			break;
			default:
			if(self.facing == true)
			{
				DlA();
			}
			else
			{
				DrA();
			}
		}
	}
	
	//Call a function based on item in hand
	if(self.weapon_held != -1)
	{
		loadTarget(self.weapon_held);
		switch(target.id)
		{
			case 9501:
			loadTarget(FOE);
			FIRE();
			break;

			case 9502:
			loadTarget(FOE);
			EARTH();
			break;
	
			case 9503:
			loadTarget(FOE);
			AIR();
			break;
		
			case 9504:
			loadTarget(FOE);
			WATER();
			break;
		
			case 9505:
			loadTarget(FOE);
			SPIRIT();
			break;
		}
 	}
	//strafe
	if(abs(self.z-target.z) < 5 && target.y > -5 && self.mp >=75)
	{
		if ((self.x-target.x) < -1 && (self.x-target.x) > -10 )
		{
			right(1,0);
			DuA();
		}else if ((self.x-target.x) > 1 && (self.x-target.x) < 10)
		{
			left(1,0);
			DuA();
		}
	}
return 0;
}

void FIRE()
{
	int FOE = loadTarget(target.num);
	BLAST();
	//Aux
	if ( self.mp >= 150 && abs(self.x-target.x) < 219 && abs (self.z-target.z) < 38)
	{
		if ((self.x-target.x) < 0)
		{
			DrJ();
		}
		else
		{
			DlJ();
		}
	}
	//Detonate
	if (self.mp >= 300)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -120 && abs(self.z-target.z) < 15)
		{
			right(1,0);
			DdJ();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 120 && abs(self.z-target.z) < 15)
		{
			left(1,0);
			DdJ();
		}
	}
}

void EARTH()
{
	int FOE = loadTarget(target.num);
	BLAST();
	//Aux
	if (self.mp >= 150 && abs(self.x-target.x) < 50 && abs (self.z-target.z) < 5)
	{
		if((self.x-target.x) < 0)
		{
			DrJ();
		}
		else
		{
			DlJ();
		}
	}
	//Detonate
	if (self.mp >= 300 && abs(self.x-target.x) < 140 && abs (self.z-target.z) < 5)
	{
		if((self.x-target.x) < 0)
		{
			right(1,0);
			DdJ();
		}
		else
		{
			left(1,0);
			DdJ();
		}
	}
}

void AIR()
{
	int FOE = loadTarget(target.num);
	//Innate Blast
	if (self.mp >= 75)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -100 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DrA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 100 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DlA();
		}
	}
	//Aux
	if (self.mp >= 150)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -300 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DrJ();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 300 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DlJ();
		}
	}
	//Detonate
	if (self.mp >= 300)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -120 && abs(self.z-target.z) < 15)
		{
			right(1,0);
			DdJ();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 120 && abs(self.z-target.z) < 15)
		{
			left(1,0);
			DdJ();
		}
	}
}

void WATER()
{
	int FOE = loadTarget(target.num);
	BLAST();
	//Aux
	if(self.mp >= 150)
	{
		if(self.facing == true)
		{
			DlJ();
		}	
		else
		{
			DrJ();
		}
	}
	//detonate
	bool NEEDHEAL=false,GOTHEAL=CHECKHEAL();
	for(int n=0; n<400; n++)
	{
		if(loadTarget(n) == 0 && target.hp > 0 && target.team == self.team && (target.dark_hp - target.hp) >=100 && GOTHEAL == false)
		{
			NEEDHEAL=true;
		}
	}
	if ((self.dark_hp-self.hp) >= 100)
	{
		NEEDHEAL=true;
	}
	loadTarget(FOE);
	if(NEEDHEAL == true && abs(self.x-target.x) > 0 && self.mp >= 300)
	{
		DdJ();
	}
}

void SPIRIT()
{
	//Innate Blast
	int FOE = loadTarget(target.num);
	if (self.mp >= 75)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -100 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DrA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 100 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DlA();
		}
	}
	//Aux; attempt to deflect an incoming projectile with spirit shield. Chance increases with difficulty.
	int BLOCKCHANCE=rand(4); //easy = 25%, normal = 50%, difficult = 75% crazy = 100%
	if ((BLOCKCHANCE - difficulty) >= 1)
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
	//Detonate
	if (self.mp >= 300)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -300 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			right(1,0);
			DdJ();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 300 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			left(1,0);
			DdJ();
		}
	}
}

void BLAST() //Item Innate Blast for FIRE/EARTH/WATER
{
	int FOE = loadTarget(target.num);
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
}

bool CHECKHEAL() //check if someone already casted an area heal
{
	for (int n=0; n<400; n++)
	{
		if(loadTarget(n) == 3 && target.id == 219 && target.frame <= 3 && target.team == self.team)
		{
			return true;
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
