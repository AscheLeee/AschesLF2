int ego()
{
	//Throw Molotov Cocktail - Only if no weapon equipped
	if(self.weapon_held == -1 && self.mp >= 150)
	{
		if ((self.x-target.x) < -20 && (self.x-target.x) > -220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DrA();
		}else if ((self.x-target.x) > 20 && (self.x-target.x) < 220 && abs(self.z-target.z) < 5 && target.y > -5)
		{
			DlA();
		}	
	}
	//Suicide Bomber
	if ( (self.mp >= 300 && abs(self.x-target.x) <= 30 && abs(self.z-target.z) <= 5 && target.state != 14))
	{
		DJA();
	}
	return 0;
}