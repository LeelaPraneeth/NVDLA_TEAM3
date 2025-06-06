//   Ordt 171103.01 autogenerated file 
//   Input: NVDLA_GLB.rdl
//   Parms: opendla.parms
//   Date: Tue May 06 14:04:50 PDT 2025
//

#include "ordt_pio_common.hpp"
#include "ordt_pio.hpp"

// ------------------ ordt_addr_elem methods ------------------

ordt_addr_elem::ordt_addr_elem(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : m_startaddress(_m_startaddress),
    m_endaddress(_m_endaddress) {
}

bool  ordt_addr_elem::containsAddress(const uint64_t &addr) {
  return ((addr >= m_startaddress) && (addr <= m_endaddress));
}

bool  ordt_addr_elem::isBelowAddress(const uint64_t &addr) {
  return (addr > m_endaddress);
}

bool  ordt_addr_elem::isAboveAddress(const uint64_t &addr) {
  return (addr < m_startaddress);
}

bool  ordt_addr_elem::hasStartAddress(const uint64_t &addr) {
  return (addr == m_startaddress);
}

void  ordt_addr_elem::update_child_ptrs() {
}

// ------------------ ordt_regset methods ------------------

ordt_addr_elem*  ordt_regset::findAddrElem(const uint64_t &addr) {
  int lo = 0;
  int hi = m_children.size()-1;
  int mid = 0;
  while (lo <= hi) {
     mid = (lo + hi) / 2;
     if (m_children[mid]->containsAddress(addr)) {
        //outElem = m_children[mid];
        return m_children[mid];
     }
     else if (m_children[mid]->isAboveAddress(addr))
        hi = mid - 1;
     else
        lo = mid + 1;
  }
  return nullptr;
}

ordt_regset::ordt_regset(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_addr_elem(_m_startaddress, _m_endaddress) {
}

int  ordt_regset::write(const uint64_t &addr, const ordt_data &wdata) {
     if (this->containsAddress(addr)) {
        childElem = this->findAddrElem(addr);
        if (childElem != nullptr) { return childElem->write(addr, wdata); }
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in regset\n";
  #endif
     return 8;
}

int  ordt_regset::read(const uint64_t &addr, ordt_data &rdata) {
     if (this->containsAddress(addr)) {
        childElem = this->findAddrElem(addr);
        if (childElem != nullptr) { return childElem->read(addr, rdata); }
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in regset\n";
  #endif
     rdata.clear();
     return 8;
}

// ------------------ ordt_reg methods ------------------

ordt_reg::ordt_reg(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_addr_elem(_m_startaddress, _m_endaddress) {
}

ordt_reg::ordt_reg(const ordt_reg &_old)
  : ordt_addr_elem(_old),
    m_mutex() {
}

void  ordt_reg::write(const ordt_data &wdata) {
}

int  ordt_reg::write(const uint64_t &addr, const ordt_data &wdata) {
     return 0;
}

void  ordt_reg::read(ordt_data &rdata) {
}

int  ordt_reg::read(const uint64_t &addr, ordt_data &rdata) {
     return 0;
}

// ------------------ ordt_rg_NVDLA_GLB_S_NVDLA_HW_VERSION methods ------------------

ordt_rg_NVDLA_GLB_S_NVDLA_HW_VERSION::ordt_rg_NVDLA_GLB_S_NVDLA_HW_VERSION(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    MAJOR(0, 8, 0x31, r_std, w_none),
    MINOR(8, 16, 0x3030, r_std, w_none) {
}

int  ordt_rg_NVDLA_GLB_S_NVDLA_HW_VERSION::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_GLB_S_NVDLA_HW_VERSION at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_GLB_S_NVDLA_HW_VERSION\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_GLB_S_NVDLA_HW_VERSION::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  MAJOR.write(wdata);
  MINOR.write(wdata);
}

int  ordt_rg_NVDLA_GLB_S_NVDLA_HW_VERSION::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_GLB_S_NVDLA_HW_VERSION at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_GLB_S_NVDLA_HW_VERSION\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_GLB_S_NVDLA_HW_VERSION::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  MAJOR.read(rdata);
  MINOR.read(rdata);
}

// ------------------ ordt_rg_NVDLA_GLB_S_INTR_MASK methods ------------------

ordt_rg_NVDLA_GLB_S_INTR_MASK::ordt_rg_NVDLA_GLB_S_INTR_MASK(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    SDP_DONE_MASK0(0, 1, 0x0, r_std, w_std),
    SDP_DONE_MASK1(1, 1, 0x0, r_std, w_std),
    CDP_DONE_MASK0(2, 1, 0x0, r_std, w_std),
    CDP_DONE_MASK1(3, 1, 0x0, r_std, w_std),
    PDP_DONE_MASK0(4, 1, 0x0, r_std, w_std),
    PDP_DONE_MASK1(5, 1, 0x0, r_std, w_std),
    BDMA_DONE_MASK0(6, 1, 0x0, r_std, w_std),
    BDMA_DONE_MASK1(7, 1, 0x0, r_std, w_std),
    RUBIK_DONE_MASK0(8, 1, 0x0, r_std, w_std),
    RUBIK_DONE_MASK1(9, 1, 0x0, r_std, w_std),
    CDMA_DAT_DONE_MASK0(16, 1, 0x0, r_std, w_std),
    CDMA_DAT_DONE_MASK1(17, 1, 0x0, r_std, w_std),
    CDMA_WT_DONE_MASK0(18, 1, 0x0, r_std, w_std),
    CDMA_WT_DONE_MASK1(19, 1, 0x0, r_std, w_std),
    CACC_DONE_MASK0(20, 1, 0x0, r_std, w_std),
    CACC_DONE_MASK1(21, 1, 0x0, r_std, w_std) {
}

int  ordt_rg_NVDLA_GLB_S_INTR_MASK::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_GLB_S_INTR_MASK at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_GLB_S_INTR_MASK\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_GLB_S_INTR_MASK::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  SDP_DONE_MASK0.write(wdata);
  SDP_DONE_MASK1.write(wdata);
  CDP_DONE_MASK0.write(wdata);
  CDP_DONE_MASK1.write(wdata);
  PDP_DONE_MASK0.write(wdata);
  PDP_DONE_MASK1.write(wdata);
  BDMA_DONE_MASK0.write(wdata);
  BDMA_DONE_MASK1.write(wdata);
  RUBIK_DONE_MASK0.write(wdata);
  RUBIK_DONE_MASK1.write(wdata);
  CDMA_DAT_DONE_MASK0.write(wdata);
  CDMA_DAT_DONE_MASK1.write(wdata);
  CDMA_WT_DONE_MASK0.write(wdata);
  CDMA_WT_DONE_MASK1.write(wdata);
  CACC_DONE_MASK0.write(wdata);
  CACC_DONE_MASK1.write(wdata);
}

int  ordt_rg_NVDLA_GLB_S_INTR_MASK::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_GLB_S_INTR_MASK at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_GLB_S_INTR_MASK\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_GLB_S_INTR_MASK::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  SDP_DONE_MASK0.read(rdata);
  SDP_DONE_MASK1.read(rdata);
  CDP_DONE_MASK0.read(rdata);
  CDP_DONE_MASK1.read(rdata);
  PDP_DONE_MASK0.read(rdata);
  PDP_DONE_MASK1.read(rdata);
  BDMA_DONE_MASK0.read(rdata);
  BDMA_DONE_MASK1.read(rdata);
  RUBIK_DONE_MASK0.read(rdata);
  RUBIK_DONE_MASK1.read(rdata);
  CDMA_DAT_DONE_MASK0.read(rdata);
  CDMA_DAT_DONE_MASK1.read(rdata);
  CDMA_WT_DONE_MASK0.read(rdata);
  CDMA_WT_DONE_MASK1.read(rdata);
  CACC_DONE_MASK0.read(rdata);
  CACC_DONE_MASK1.read(rdata);
}

// ------------------ ordt_rg_NVDLA_GLB_S_INTR_SET methods ------------------

ordt_rg_NVDLA_GLB_S_INTR_SET::ordt_rg_NVDLA_GLB_S_INTR_SET(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    SDP_DONE_SET0(0, 1, 0x0, r_none, w_std),
    SDP_DONE_SET1(1, 1, 0x0, r_none, w_std),
    CDP_DONE_SET0(2, 1, 0x0, r_none, w_std),
    CDP_DONE_SET1(3, 1, 0x0, r_none, w_std),
    PDP_DONE_SET0(4, 1, 0x0, r_none, w_std),
    PDP_DONE_SET1(5, 1, 0x0, r_none, w_std),
    BDMA_DONE_SET0(6, 1, 0x0, r_none, w_std),
    BDMA_DONE_SET1(7, 1, 0x0, r_none, w_std),
    RUBIK_DONE_SET0(8, 1, 0x0, r_none, w_std),
    RUBIK_DONE_SET1(9, 1, 0x0, r_none, w_std),
    CDMA_DAT_DONE_SET0(16, 1, 0x0, r_none, w_std),
    CDMA_DAT_DONE_SET1(17, 1, 0x0, r_none, w_std),
    CDMA_WT_DONE_SET0(18, 1, 0x0, r_none, w_std),
    CDMA_WT_DONE_SET1(19, 1, 0x0, r_none, w_std),
    CACC_DONE_SET0(20, 1, 0x0, r_none, w_std),
    CACC_DONE_SET1(21, 1, 0x0, r_none, w_std) {
}

int  ordt_rg_NVDLA_GLB_S_INTR_SET::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_GLB_S_INTR_SET at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_GLB_S_INTR_SET\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_GLB_S_INTR_SET::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  SDP_DONE_SET0.write(wdata);
  SDP_DONE_SET1.write(wdata);
  CDP_DONE_SET0.write(wdata);
  CDP_DONE_SET1.write(wdata);
  PDP_DONE_SET0.write(wdata);
  PDP_DONE_SET1.write(wdata);
  BDMA_DONE_SET0.write(wdata);
  BDMA_DONE_SET1.write(wdata);
  RUBIK_DONE_SET0.write(wdata);
  RUBIK_DONE_SET1.write(wdata);
  CDMA_DAT_DONE_SET0.write(wdata);
  CDMA_DAT_DONE_SET1.write(wdata);
  CDMA_WT_DONE_SET0.write(wdata);
  CDMA_WT_DONE_SET1.write(wdata);
  CACC_DONE_SET0.write(wdata);
  CACC_DONE_SET1.write(wdata);
}

int  ordt_rg_NVDLA_GLB_S_INTR_SET::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_GLB_S_INTR_SET at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_GLB_S_INTR_SET\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_GLB_S_INTR_SET::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  SDP_DONE_SET0.read(rdata);
  SDP_DONE_SET1.read(rdata);
  CDP_DONE_SET0.read(rdata);
  CDP_DONE_SET1.read(rdata);
  PDP_DONE_SET0.read(rdata);
  PDP_DONE_SET1.read(rdata);
  BDMA_DONE_SET0.read(rdata);
  BDMA_DONE_SET1.read(rdata);
  RUBIK_DONE_SET0.read(rdata);
  RUBIK_DONE_SET1.read(rdata);
  CDMA_DAT_DONE_SET0.read(rdata);
  CDMA_DAT_DONE_SET1.read(rdata);
  CDMA_WT_DONE_SET0.read(rdata);
  CDMA_WT_DONE_SET1.read(rdata);
  CACC_DONE_SET0.read(rdata);
  CACC_DONE_SET1.read(rdata);
}

// ------------------ ordt_rg_NVDLA_GLB_S_INTR_STATUS methods ------------------

ordt_rg_NVDLA_GLB_S_INTR_STATUS::ordt_rg_NVDLA_GLB_S_INTR_STATUS(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    SDP_DONE_STATUS0(0, 1, 0x0, r_std, w_std),
    SDP_DONE_STATUS1(1, 1, 0x0, r_std, w_std),
    CDP_DONE_STATUS0(2, 1, 0x0, r_std, w_std),
    CDP_DONE_STATUS1(3, 1, 0x0, r_std, w_std),
    PDP_DONE_STATUS0(4, 1, 0x0, r_std, w_std),
    PDP_DONE_STATUS1(5, 1, 0x0, r_std, w_std),
    BDMA_DONE_STATUS0(6, 1, 0x0, r_std, w_std),
    BDMA_DONE_STATUS1(7, 1, 0x0, r_std, w_std),
    RUBIK_DONE_STATUS0(8, 1, 0x0, r_std, w_std),
    RUBIK_DONE_STATUS1(9, 1, 0x0, r_std, w_std),
    CDMA_DAT_DONE_STATUS0(16, 1, 0x0, r_std, w_std),
    CDMA_DAT_DONE_STATUS1(17, 1, 0x0, r_std, w_std),
    CDMA_WT_DONE_STATUS0(18, 1, 0x0, r_std, w_std),
    CDMA_WT_DONE_STATUS1(19, 1, 0x0, r_std, w_std),
    CACC_DONE_STATUS0(20, 1, 0x0, r_std, w_std),
    CACC_DONE_STATUS1(21, 1, 0x0, r_std, w_std) {
}

int  ordt_rg_NVDLA_GLB_S_INTR_STATUS::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_GLB_S_INTR_STATUS at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_GLB_S_INTR_STATUS\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_GLB_S_INTR_STATUS::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  SDP_DONE_STATUS0.write(wdata);
  SDP_DONE_STATUS1.write(wdata);
  CDP_DONE_STATUS0.write(wdata);
  CDP_DONE_STATUS1.write(wdata);
  PDP_DONE_STATUS0.write(wdata);
  PDP_DONE_STATUS1.write(wdata);
  BDMA_DONE_STATUS0.write(wdata);
  BDMA_DONE_STATUS1.write(wdata);
  RUBIK_DONE_STATUS0.write(wdata);
  RUBIK_DONE_STATUS1.write(wdata);
  CDMA_DAT_DONE_STATUS0.write(wdata);
  CDMA_DAT_DONE_STATUS1.write(wdata);
  CDMA_WT_DONE_STATUS0.write(wdata);
  CDMA_WT_DONE_STATUS1.write(wdata);
  CACC_DONE_STATUS0.write(wdata);
  CACC_DONE_STATUS1.write(wdata);
}

int  ordt_rg_NVDLA_GLB_S_INTR_STATUS::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_GLB_S_INTR_STATUS at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_GLB_S_INTR_STATUS\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_GLB_S_INTR_STATUS::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  SDP_DONE_STATUS0.read(rdata);
  SDP_DONE_STATUS1.read(rdata);
  CDP_DONE_STATUS0.read(rdata);
  CDP_DONE_STATUS1.read(rdata);
  PDP_DONE_STATUS0.read(rdata);
  PDP_DONE_STATUS1.read(rdata);
  BDMA_DONE_STATUS0.read(rdata);
  BDMA_DONE_STATUS1.read(rdata);
  RUBIK_DONE_STATUS0.read(rdata);
  RUBIK_DONE_STATUS1.read(rdata);
  CDMA_DAT_DONE_STATUS0.read(rdata);
  CDMA_DAT_DONE_STATUS1.read(rdata);
  CDMA_WT_DONE_STATUS0.read(rdata);
  CDMA_WT_DONE_STATUS1.read(rdata);
  CACC_DONE_STATUS0.read(rdata);
  CACC_DONE_STATUS1.read(rdata);
}

// ------------------ ordt_rset_NVDLA_GLB methods ------------------

ordt_rset_NVDLA_GLB::ordt_rset_NVDLA_GLB(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_regset(_m_startaddress, _m_endaddress),
    S_NVDLA_HW_VERSION(_m_startaddress + 0x0, _m_startaddress + 0x3),
    S_INTR_MASK(_m_startaddress + 0x4, _m_startaddress + 0x7),
    S_INTR_SET(_m_startaddress + 0x8, _m_startaddress + 0xb),
    S_INTR_STATUS(_m_startaddress + 0xc, _m_startaddress + 0xf) {
  m_children.push_back(&S_NVDLA_HW_VERSION);
  m_children.push_back(&S_INTR_MASK);
  m_children.push_back(&S_INTR_SET);
  m_children.push_back(&S_INTR_STATUS);
}

void  ordt_rset_NVDLA_GLB::update_child_ptrs() {
  m_children.clear();
  m_children.push_back(&S_NVDLA_HW_VERSION);
  m_children.push_back(&S_INTR_MASK);
  m_children.push_back(&S_INTR_SET);
  m_children.push_back(&S_INTR_STATUS);
}

// ------------------ ordt_root methods ------------------

ordt_root::ordt_root()
  : ordt_root(0x0, 0x100f) {
}

ordt_root::ordt_root(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_regset(_m_startaddress, _m_endaddress),
    NVDLA_GLB(_m_startaddress + 0x1000, _m_startaddress + 0x100f) {
  m_children.push_back(&NVDLA_GLB);
}

void  ordt_root::update_child_ptrs() {
  m_children.clear();
  m_children.push_back(&NVDLA_GLB);
}

