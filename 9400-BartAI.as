void id()
{
	//choose a target
    for (int n = 0; n < 400; n++)
	{
        if (loadTarget(n) == 0 && target.team != self.team)
		break;
	}
	//in stage mode, move to next stage if cleared
	if(mode == 1 && stage_clear == true)
	{
		right(1,0);
		right(1,0);	
	}
	int FOE = loadTarget(target.num); //'remember' who the enemy is, if switching targets to ally for healing.
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
	//Offensive playstyle?
	bool OFFENSIVE;
	if(NEEDHEAL == false || GOTHEAL == true)
	{
		OFFENSIVE = true;
	}else
	{
		OFFENSIVE = false;
	}
	RESET();
	if(stage_clear == false)
	{
		RESET_MOVE();
	}
	//run away
	if(stage_clear == false && self.weapon_type != 1)
	{
		if((self.x-target.x) < 50  && (self.x-target.x) > 0) 	//if target is on left
		{
			if( (stage_bound - self.x) < 90 )
			{
				right(1,0);
				right(1,0);
			}
			else
			{
				left(1,0);
				left(1,0);
			}
		}
		else if((self.x-target.x) > -50  && (self.x-target.x) < 0) 	//if target is on right
		{
			if(self.x > 90)
			{
				left(1,0);
				left(1,0);
			}
			else
			{
				right(1,0);
				right(1,0);
			}
		}
		else if((self.x-target.x) == 0) //if target is exactly same position
		{
			int RANDOM_LR_DIRECTION = rand(2);
			switch(RANDOM_LR_DIRECTION)
			{
				case 0:
				left(1,0);
				left(1,0);
				break;
				case 1:
				right(1,0);
				right(1,0);
				break;
			}
		}
	}
	//running actions
	if(self.state == 2 && stage_clear == false)
	{
		switch(self.weapon_type)
		{
			case 1: // equipped with melee weapon - throw weapon at enemy
			if ((self.x-target.x) < 0 && (self.x-target.x) > -200 && abs(self.z-target.z) < 5 && target.y > -5 && self.facing == false)
			{		
				A(1,0);
			}
			if ((self.x-target.x) > 0 && (self.x-target.x) < 200 && abs(self.z-target.z) < 5 && target.y > -5 && self.facing == true)
			{
				A(1,0);
			}
			break;
			default:
			if(OFFENSIVE == false)
			{
				//end with roll if far enough
				if((self.x-target.x) > 200 || (self.x-target.x) < -200)
				{
					D(1,0);
				}
			}else //offensive - attempt a running attack
			{
				if ((self.x-target.x) < 0 && (self.x-target.x) > -90 && abs(self.z-target.z) < 5 && target.y > -5 && self.facing == false)
				{
					A(1,0);
				}
				if ((self.x-target.x) > 0 && (self.x-target.x) < 90 && abs(self.z-target.z) < 5 && target.y > -5 && self.facing == true)
				{
					A(1,0);
				}
			}
		}
	}
	//attacks - standing or walking
	if(target.state != 14 && self.state <= 1 && stage_clear == false)
	{
		switch(self.weapon_type)
		{
			case 1: //equipped with melee weapon
			if ((self.x-target.x) < 0 && (self.x-target.x) > -75 && abs(self.z-target.z) < 5 && target.y > -5)
			{
				right(1,0);			
				A(1,0);
			}
			if ((self.x-target.x) > 0 && (self.x-target.x) < 75 && abs(self.z-target.z) < 5 && target.y > -5)
			{

				left(1,0);			
				A(1,0);
			}
			break;
			default:
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
	}
	//Backflip if aired, chance scales with difficulty.
	int FLIPCHANCE=rand(4); //easy = 25%, normal = 50%, difficult = 75% crazy = 100%
	if (self.state == 12 && (FLIPCHANCE - difficulty) >= 1)
	{
		J(1,0);
	}
	//skills
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
	if (stage_clear == false && NEARFOE == false && self.frame <235 && (self.mp >= 325 || (SAVEMP == false && self.mp >= 125)))
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
	if (stage_clear == false && self.frame <235 && SAVEMP == false && self.mp >= 350 && abs(self.x-target.x) < 219 && abs (self.z-target.z) < 38)
	{
		DuJ();
	}
	//pursue enemies - offensive playstyle only
	if(OFFENSIVE == true && stage_clear == false)
	{
		//xaxis chasing
		if( (self.x-target.x) <= -400 || (self.weapon_type == 1 && (self.x-target.x) <= -75) )
		{
			right(1,0);
			right(1,0);				
		}
		if((self.x-target.x) >= 400 || (self.weapon_type == 1 && (self.x-target.x) >= 75))
		{
			left(1,0);
			left(1,0);				
		}
		//zaxis alignment
		if (target.z > (self.z + 1) )
		{
			down(1,0);
		}
		if (target.z < (self.z - 1) )
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
