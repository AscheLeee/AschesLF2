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
	//Heal
	if (NEEDHEAL == true && self.mp >= 200)
	{
		DuJ();
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
	//Ice Blast
	int ISFOE = CHECKFOE();
	if (ISFOE == true && (self.mp >= 275 || (SAVEMP == false && self.mp >= 75 )))
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DrA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DlA();
		}
	}
	//Freezing Disk
	if (ISFOE == true && (self.mp >= 450 || (SAVEMP == false && self.mp >= 250 )))
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -300 && abs(self.z-target.z) < 15)
		{
			DrJ();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 300 && abs(self.z-target.z) < 15)
		{
			DlJ();
		}
	}
	//Overwhelming Disaster
	if (ISFOE == true && (self.mp >= 300 || (SAVEMP == 0 && self.mp >= 100 )))
	{
		if (abs(self.x-target.x)>=0)
		{
		DuA();
		}
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

bool CHECKFOE() //check if target is enemy
{
	if(target.team != self.team && target.type == 0) 
	{
		return true;
	}
	else
	{
	return false;
	}
}
