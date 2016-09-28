int ego()
{
	RESET();
	//FIRING MAH LAZOR
	bool LAZOR_R = false;
	bool LAZOR_L = false;
	if ((self.x-target.x) < -80 && (self.x-target.x) > -400 && abs(self.z-target.z) < 5 && target.y > -5 && target.state !=  14)
	{
		LAZOR_R = true;
	}else
	{
		LAZOR_R = false;
	}
	if ((self.x-target.x) > 80 && (self.x-target.x) < 400 && abs(self.z-target.z) < 5 && target.y > -5 && target.state !=  14)
	{
		LAZOR_L = true;
	}else
	{
		LAZOR_L = false;
	}
	if (self.frame <= 234 && self.mp >= 25)
	{
		if(LAZOR_R == true)
		{
			DrJ();
		}
		if(LAZOR_L == true)
		{
			DlJ();
		}
	}
	if ( self.frame >= 265 && self.frame <= 273 && ( (self.facing == false && LAZOR_R == false) || (self.facing == true && LAZOR_L == false) ) )
	{
		D(1,0);
	}
	//Overwhelming Disaster
	if (self.mp >= 100 && abs(self.x-target.x)>=0 && abs(self.x-target.x)<= 300)
	{
		DuA();
	}
	//Arctic Volcano
	if (self.mp >= 250 && abs(self.x-target.x) <= 5 && abs(self.x-target.x) <= 100)
	{
		DuJ();
	}
	//SelfDetonate
	int FOE=target.num;
	bool GOTALLY = false;
	for (int n=0; n<400; n++)
	{
		if(loadTarget(n) == 0 && target.hp > 0 && target.team == self.team && target.num != self.num)
		{
			GOTALLY = true;
		}
	}
	loadTarget(FOE);
	if(GOTALLY == false && self.team == 5)
	{
		DJA();
	}
	return 0;
}

void RESET() //Reset DJA inputs
{
	A(0,0);
	J(0,0);
	D(0,0);
}
