int ego()
{
	bool TARGET_MAIN = CHECK_TARGET_MAIN();
	//grab enemy. ensure enough MP to transform before grabbing.
	if (TARGET_MAIN == true && self.mp >= 200 &&(self.x-target.x) < -10 && (self.x-target.x) > -200 && abs(self.z-target.z) < 5 && target.y > -5 && target.state != 14)
	{
		DrJ();
	}else if ((self.x-target.x) > 10 && (self.x-target.x) < 200 && abs(self.z-target.z) < 5 && target.y > -5 && target.state != 14)
	{
		DlJ();
	}
	//transform into caught enemy
	if(TARGET_MAIN == true && self.frame >= 120 && self.frame <= 124 && self.mp >= 150 && target.frame >= 130 && target.frame <= 144)
	{
		DJA();
	}
	return 0;
}

bool CHECK_TARGET_MAIN()
{
	if( (target.id >= 30 && target.id <= 39) || (target.id >= 4000 && target.id <= 4999) )
	{
		return false;
	}
	return true;
}
