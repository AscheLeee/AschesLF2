void id()
{
	RESET();
	RESET_MOVE();
	//choose a target
    for (int n = 0; n < 400; n++)
    {
        if (loadTarget(n) == 0 && target.team != self.team)
		break;
    }
	int FOE = loadTarget(target.num); //'remember' who the enemy is, if switching targets to ally for healing.
	//run away
	if((self.x-target.x) < 80  && (self.x-target.x) > 0)
	{
		right(1,0);
		right(1,0);		
	}
	if((self.x-target.x) > -80  && (self.x-target.x) < 0)
	{
		left(1,0);
		left(1,0);		
	}
	//stop running
	if(self.state == 2)
	{
		if((self.x-target.x) > 100 || (self.x-target.x) < -100)
		{
			D(1,0);
		}
	}
	//attack
	if(target.state != 14 && self.state <= 1)
	{
		if ((self.x-target.x) < -20 && (self.x-target.x) > -400 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			right(1,0);			
			A(1,0);
		}
		if ((self.x-target.x) > 20 && (self.x-target.x) < 400 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			left(1,0);
			A(1,0);
		}
	}
	//skills
	bool NEARFOE=CHECKNEARFOE(); 	//Check for nearby enemies before playing a song? /*only for normal or higher*/
	//Are there any living allies? Does anyone need heals?
	bool GOTALLY=false,NEEDHEAL=false,GOTHEAL=CHECKHEAL();
	for (int n=0; n<400; n++)
	{
		  if(loadTarget(n) == 0 && target.hp > 0 && target.team == self.team)
		{
			GOTALLY=true;
			if( (target.dark_hp - target.hp) >= 100 && GOTHEAL==false)
			{
				NEEDHEAL=true;
			}
		}
	}
	loadTarget(FOE);
	if ( (self.dark_hp - self.hp) >= 100 && GOTHEAL==false)
	{
		NEEDHEAL=true;
	}
	//Save MP for heals? /*only on normal or higher*/
	bool SAVEMP=false;
	if (difficulty != 2 && GOTALLY == true)
	{
		SAVEMP=true;
	}
	//Heal
	if (NEEDHEAL == true && self.mp >= 200 && NEARFOE == false && self.frame < 235)
	{
		DuA();
	}
	//Melody of Mana
	if (self.hp > 300 && self.mp < 300 && NEARFOE == false && self.frame < 235)
	{
		DdJ(); //Begin Melody of Mana
	}
	if (self.frame == 275)
	{
		A(1,0);
	}
	//Dirge for the Deceased
	if (NEARFOE == false && self.frame <235 && (self.mp >= 325 || (SAVEMP == false && self.mp >= 125)))
	{
		if (self.facing == true)
		{
			DlA();
		}	
		else
		{
			DrA();
		}
	}
	//Sonata of the Death
	if (self.frame <235 && SAVEMP == false && self.mp >= 350 && abs(self.x-target.x) < 219 && abs (self.z-target.z) < 38)
	{
		DuJ();
	}
	//pursue enemies - only if no healing is needed.
	if(NEEDHEAL == false || GOTHEAL == true)
	{
		//xaxis chasing
		if((self.x-target.x) <= -400)
		{
			right(1,0);
			right(1,0);				
		}
		if((self.x-target.x) >= 400)
		{
			left(1,0);
			left(1,0);				
		}
		//zaxis alignment
		if (target.z > (self.z + 5) )
		{
			down(1,0);
		}
		if (target.z < (self.z - 5) )
		{
			up(1,0);
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

void RESET() //Reset DJA inputs
{
	A(0,0);
	J(0,0);
	D(0,0);
}

void RESET_MOVE() //Reset movement inputs
{
	up(0,0);
	down(0,0);
	left(0,0);
	right(0,0);
}
