int ego()//Work in progress, please wait warmly until it is ready
{
	int FOE = loadTarget(target.num);
	int CHOOSE;
	//Check if holding an item, else try to make an item
	if(self.weapon_held == -1 && self.mp >= 100 && (self.frame < 235 || self.frame > 260))
	{
		CHOOSE=rand(5); //0 - fire (D), 1 - earth(AD), 2 - air(AAD), 3 - water(JJD), 4 - spirit(JD)
		DdJ();		
	}
	switch(self.frame)
	{
	case 237: //preview fire
		if(CHOOSE == 0)
		{
			D(1,0); //confirm fire
		}else if(CHOOSE <= 2)//forward cycling, for earth or air
		{
			A(1,0); 
		}
		else if(CHOOSE >=3) // backwards cycling, for spirit or water
		{
			J(1,0);
		}
	break;
	case 242: //preview earth
		if(CHOOSE == 1)
		{
			D(1,0); //confirm earth
		}else
		{
			A(1,0); //preview air
		}
	break;
	case 247:
		D(1,0); //confirm air
	break;
	case 257: //preview spirit
		if(CHOOSE == 4)
		{
			D(1,0); //confirm spirit
		}else
    		{
			J(1,0); //preview water
    		}
  	break;
  	case 252: //preview water
  		D(1,0); //confirm water
	break;
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
			DJA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 120 && abs(self.z-target.z) < 15)
		{
			left(1,0);
			DJA();
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
			DJA();
		}
		else
		{
			left(1,0);
			DJA();
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
			DJA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 120 && abs(self.z-target.z) < 15)
		{
			left(1,0);
			DJA();
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
		DJA();
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
			DJA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 300 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			left(1,0);
			DJA();
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
