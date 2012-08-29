#ifndef _INC_PROTEIN_HPP
#define _INC_PROTEIN_HPP

class Protein {
public:
  virtual ~Protein() {};

  virtual void render() = 0;
};

#endif
