int ego()
{
	//cancel berserk if low HP
	if(self.hp <= 250 && self.id == 801 && self.frame < 235)
	{
		DuA();
	}
	//Energy Blasts
	if (self.mp >= 75 && self.hp > 250 && target.state != 14)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			if(self.frame < 235)
			{
				DrA();
			}else if(!self.facing)
			{
				BLAST_CONTINUE();
			}
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			if(self.frame < 235)
			{
				DlA();
			}else if(self.facing)
			{
				BLAST_CONTINUE();
			}
		}
	}
	//Strafe
	if (self.mp >= 150 && self.hp > 250 && target.state != 14)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -123 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DrJ();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 123 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DlJ();
		}
	}
	//Strike
	if (self.mp >= 75 && self.hp > 250 && target.state != 14)
	{
		if ((self.x-target.x) < -10 && (self.x-target.x) > -80 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			if(self.facing)
			{
				left(1,0);
			}
			DdA();
		}else if ((self.x-target.x) > 10 && (self.x-target.x) < 80 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			if(!self.facing)
			{
				right(1,0);
			}
			DdA();
		}
	}		
	return 0;
}

void BLAST_CONTINUE()
{
	int CONT_CHANCE=rand(4); //easy = 25%, normal = 50%, difficult = 75% crazy = 100%
	switch(self.frame)
	{
		case 238: case 243:
		if ((CONT_CHANCE - difficulty) >= 1)
		{
			A(1,0);
		}
		break;
		case 239: case 244:
		A(1,0);
		break;
	}
}