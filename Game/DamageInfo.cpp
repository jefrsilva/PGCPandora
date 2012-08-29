#include "DamageInfo.hpp"

DamageInfo::DamageInfo() {

}

DamageInfo::DamageInfo(const DamageInfo &damage) {
  this->damageType = damage.getDamageType();
  this->damageColor = damage.getDamageColor();
  this->attackSpeed = damage.getSpeed();
  this->attackRange = damage.getRange();
  this->damageValue = damage.getDamageValue();
  this->damageCooldown = damage.getDamageCooldown();
}

DamageInfo::DamageInfo(AntibodyType damageType,
		       VirusColor damageColor,
		       double attackSpeed,
		       double attackRange,
		       int damageValue,
		       int damageCooldown) {
  this->damageType = damageType;
  this->damageColor = damageColor;
  this->attackSpeed = attackSpeed;
  this->attackRange = attackRange;
  this->damageValue = damageValue;
  this->damageCooldown = damageCooldown;
}

DamageInfo::~DamageInfo() {

}

AntibodyType DamageInfo::getDamageType() const {
  return damageType;
}

VirusColor DamageInfo::getDamageColor() const {
  return damageColor;
}

double DamageInfo::getSpeed() const {
  return attackSpeed;
}

double DamageInfo::getRange() const {
  return attackRange;
}

int DamageInfo::getDamageValue() const {
  return damageValue;
}

int DamageInfo::getDamageCooldown() const {
  return damageCooldown;
}
