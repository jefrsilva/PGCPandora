#ifndef _INC_DAMAGEINFO_HPP
#define _INC_DAMAGEINFO_HPP

#include "Constants.hpp"

class DamageInfo {
private:
  AntibodyType damageType;
  VirusColor damageColor;
  double attackSpeed;
  double attackRange;
  int damageValue;
  int damageCooldown;

public:
  DamageInfo();
  DamageInfo(const DamageInfo &damage);
  DamageInfo(AntibodyType damageType, VirusColor damageColor, 
	     double attackSpeed, double attackRange,
	     int damageValue, int damageCooldown);
  ~DamageInfo();

  AntibodyType getDamageType() const;
  VirusColor getDamageColor() const;
  double getSpeed() const;
  double getRange() const;
  int getDamageValue() const;
  int getDamageCooldown() const;
};

#endif
