//   Ordt 171103.01 autogenerated file 
//   Input: NVDLA_CDP.rdl
//   Parms: opendla.parms
//   Date: Tue May 06 14:04:57 PDT 2025
//

#include "ordt_pio_common.hpp"

// ------------------ ordt_data methods ------------------

ordt_data::ordt_data()
  : std::vector<uint32_t>() {
}

ordt_data::ordt_data(int _size, uint32_t _data)
  : std::vector<uint32_t>(_size, _data) {
}

ordt_data::ordt_data(const ordt_data& _data)
  : std::vector<uint32_t>(_data) {
}

void  ordt_data::set_slice(int lobit, int size, const ordt_data& update) {
  int data_size = this->size() * 32;
  if ((lobit % 32) > 0) {
    std::cout << "ERROR set_slice: non 32b aligned slices are not supported" << "\n";
    return;
  }
  int hibit = lobit + size - 1;
  int loword = lobit / 32;
  int hiword = hibit / 32;
  if (hibit > data_size - 1) {
    std::cout << "ERROR set_slice: specified slice is not contained in data" << "\n";
    return;
  }
  int update_idx=0;
  for (int idx=loword; idx < hiword + 1; idx++) {
    if (idx == hiword) {
       int modsize = hibit - hiword*32 + 1;
       uint32_t mask = (modsize == 32)? 0xffffffff : (1 << modsize) - 1;
       this->at(idx) = (this->at(idx) & ~mask) ^ (update.at(update_idx) & mask);
    }
    else this->at(idx) = update.at(update_idx);
    update_idx++;
  }
}

void  ordt_data::get_slice(int lobit, int size, ordt_data& slice_out) const {
  int data_size = this->size() * 32;
  if ((lobit % 32) > 0) {
    std::cout << "ERROR set_slice: non 32b aligned large fields are not supported" << "\n";
    return;
  }
  slice_out.clear();
  int hibit = lobit + size - 1;
  int loword = lobit / 32;
  int hiword = hibit / 32;
  if (hibit > data_size - 1) {
    std::cout << "ERROR set_slice: specified slice is not contained in data" << "\n";
    return;
  }
  int out_idx=0;
  for (int idx=loword; idx < hiword + 1; idx++) {
    if (idx == hiword) {
       int modsize = hibit - hiword*32 + 1;
       uint32_t mask = (modsize == 32)? 0xffffffff : (1 << modsize) - 1;
       slice_out.at(out_idx) = (this->at(idx) & mask);
    }
    else slice_out.at(out_idx) = this->at(idx);
    out_idx++;
  }
  return;
}

std::string  ordt_data::to_string() const {
  std::stringstream ss;
  ss << "{" << std::hex << std::showbase;
  for (int idx=this->size() - 1; idx >= 0; idx--) 
     ss << " " << this->at(idx);
  ss << " }";
  return ss.str();
}

ordt_data&  ordt_data::operator=(const uint32_t rhs) {
     this->assign(this->size(), rhs);
  return *this;
}

ordt_data  ordt_data::operator~() {
  ordt_data temp;
  for (int idx=0; idx<this->size(); idx++) 
     temp.at(idx) = ~ this->at(idx);
  return temp;
}

ordt_data  ordt_data::operator&(const ordt_data& rhs) {
  ordt_data temp;
  for (int idx=0; idx<this->size(); idx++) 
     if (idx < rhs.size()) temp.at(idx) = this->at(idx) & rhs.at(idx);
     else temp.at(idx) = 0;
  return temp;
}

ordt_data  ordt_data::operator|(const ordt_data& rhs) {
  ordt_data temp;
  for (int idx=0; idx<this->size(); idx++) 
     if (idx < rhs.size()) temp.at(idx) = this->at(idx) | rhs.at(idx);
     else temp.at(idx) = this->at(idx);
  return temp;
}

