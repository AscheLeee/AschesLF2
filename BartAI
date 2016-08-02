int ego()
{
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
	//Check for nearby enemies before playing a song? /*only for normal or higher*/
	bool NEARFOE=CHECKNEARFOE();
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
	//Prioritise healing over damage dealing - only on difficult or crazy
	if (difficulty <= 0)
	{
	GOTHEAL=CHECKHEAL();
		if (GOTHEAL==false && NEEDHEAL==true)
		{
		return 0;
		}
  	}

	//Dirge for the Deceased
	if (NEARFOE == false && self.frame <235 && (self.mp >= 350 || (SAVEMP == false && self.mp >= 150)))
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
	//Sonata of the Death
	if (self.frame <235 && SAVEMP == false && self.mp >= 350 && abs(self.x-target.x) < 219 && abs (self.z-target.z) < 38)
	{
		DuJ();
	}
return 0;
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
	if ((abs(self.x - target.x) < 200 || abs(self.z - target.z) < 100 ) && difficulty != 2)
	{
		return true;
	}
	else
	{
		return false;
	}
}
