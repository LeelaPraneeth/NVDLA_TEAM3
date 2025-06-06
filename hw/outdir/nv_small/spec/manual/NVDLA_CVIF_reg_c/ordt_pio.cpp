//   Ordt 171103.01 autogenerated file 
//   Input: NVDLA_CVIF.rdl
//   Parms: opendla.parms
//   Date: Tue May 06 14:04:59 PDT 2025
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

// ------------------ ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_0 methods ------------------

ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_0::ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_0(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    RD_WEIGHT_BDMA(0, 8, 0x1, r_std, w_std),
    RD_WEIGHT_SDP(8, 8, 0x1, r_std, w_std),
    RD_WEIGHT_PDP(16, 8, 0x1, r_std, w_std),
    RD_WEIGHT_CDP(24, 8, 0x1, r_std, w_std) {
}

int  ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_0::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_0 at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_0\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_0::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  RD_WEIGHT_BDMA.write(wdata);
  RD_WEIGHT_SDP.write(wdata);
  RD_WEIGHT_PDP.write(wdata);
  RD_WEIGHT_CDP.write(wdata);
}

int  ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_0::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_0 at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_0\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_0::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  RD_WEIGHT_BDMA.read(rdata);
  RD_WEIGHT_SDP.read(rdata);
  RD_WEIGHT_PDP.read(rdata);
  RD_WEIGHT_CDP.read(rdata);
}

// ------------------ ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_1 methods ------------------

ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_1::ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_1(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    RD_WEIGHT_SDP_B(0, 8, 0x1, r_std, w_std),
    RD_WEIGHT_SDP_N(8, 8, 0x1, r_std, w_std),
    RD_WEIGHT_SDP_E(16, 8, 0x1, r_std, w_std),
    RD_WEIGHT_CDMA_DAT(24, 8, 0x1, r_std, w_std) {
}

int  ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_1::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_1 at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_1\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_1::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  RD_WEIGHT_SDP_B.write(wdata);
  RD_WEIGHT_SDP_N.write(wdata);
  RD_WEIGHT_SDP_E.write(wdata);
  RD_WEIGHT_CDMA_DAT.write(wdata);
}

int  ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_1::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_1 at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_1\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_1::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  RD_WEIGHT_SDP_B.read(rdata);
  RD_WEIGHT_SDP_N.read(rdata);
  RD_WEIGHT_SDP_E.read(rdata);
  RD_WEIGHT_CDMA_DAT.read(rdata);
}

// ------------------ ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_2 methods ------------------

ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_2::ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_2(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    RD_WEIGHT_CDMA_WT(0, 8, 0x1, r_std, w_std),
    RD_WEIGHT_RBK(8, 8, 0x1, r_std, w_std),
    RD_WEIGHT_RSV_1(16, 8, 0x1, r_std, w_std),
    RD_WEIGHT_RSV_0(24, 8, 0x1, r_std, w_std) {
}

int  ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_2::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_2 at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_2\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_2::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  RD_WEIGHT_CDMA_WT.write(wdata);
  RD_WEIGHT_RBK.write(wdata);
  RD_WEIGHT_RSV_1.write(wdata);
  RD_WEIGHT_RSV_0.write(wdata);
}

int  ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_2::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_2 at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_2\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_CVIF_CFG_RD_WEIGHT_2::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  RD_WEIGHT_CDMA_WT.read(rdata);
  RD_WEIGHT_RBK.read(rdata);
  RD_WEIGHT_RSV_1.read(rdata);
  RD_WEIGHT_RSV_0.read(rdata);
}

// ------------------ ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_0 methods ------------------

ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_0::ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_0(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    WR_WEIGHT_BDMA(0, 8, 0x1, r_std, w_std),
    WR_WEIGHT_SDP(8, 8, 0x1, r_std, w_std),
    WR_WEIGHT_PDP(16, 8, 0x1, r_std, w_std),
    WR_WEIGHT_CDP(24, 8, 0x1, r_std, w_std) {
}

int  ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_0::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_0 at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_0\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_0::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  WR_WEIGHT_BDMA.write(wdata);
  WR_WEIGHT_SDP.write(wdata);
  WR_WEIGHT_PDP.write(wdata);
  WR_WEIGHT_CDP.write(wdata);
}

int  ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_0::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_0 at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_0\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_0::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  WR_WEIGHT_BDMA.read(rdata);
  WR_WEIGHT_SDP.read(rdata);
  WR_WEIGHT_PDP.read(rdata);
  WR_WEIGHT_CDP.read(rdata);
}

// ------------------ ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_1 methods ------------------

ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_1::ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_1(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    WR_WEIGHT_RBK(0, 8, 0x1, r_std, w_std),
    WR_WEIGHT_RSV_2(8, 8, 0x1, r_std, w_std),
    WR_WEIGHT_RSV_1(16, 8, 0x1, r_std, w_std),
    WR_WEIGHT_RSV_0(24, 8, 0x1, r_std, w_std) {
}

int  ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_1::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_1 at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_1\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_1::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  WR_WEIGHT_RBK.write(wdata);
  WR_WEIGHT_RSV_2.write(wdata);
  WR_WEIGHT_RSV_1.write(wdata);
  WR_WEIGHT_RSV_0.write(wdata);
}

int  ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_1::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_1 at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_1\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_CVIF_CFG_WR_WEIGHT_1::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  WR_WEIGHT_RBK.read(rdata);
  WR_WEIGHT_RSV_2.read(rdata);
  WR_WEIGHT_RSV_1.read(rdata);
  WR_WEIGHT_RSV_0.read(rdata);
}

// ------------------ ordt_rg_NVDLA_CVIF_CFG_OUTSTANDING_CNT methods ------------------

ordt_rg_NVDLA_CVIF_CFG_OUTSTANDING_CNT::ordt_rg_NVDLA_CVIF_CFG_OUTSTANDING_CNT(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    RD_OS_CNT(0, 8, 0xff, r_std, w_std),
    WR_OS_CNT(8, 8, 0xff, r_std, w_std) {
}

int  ordt_rg_NVDLA_CVIF_CFG_OUTSTANDING_CNT::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_CVIF_CFG_OUTSTANDING_CNT at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_CFG_OUTSTANDING_CNT\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_CVIF_CFG_OUTSTANDING_CNT::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  RD_OS_CNT.write(wdata);
  WR_OS_CNT.write(wdata);
}

int  ordt_rg_NVDLA_CVIF_CFG_OUTSTANDING_CNT::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_CVIF_CFG_OUTSTANDING_CNT at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_CFG_OUTSTANDING_CNT\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_CVIF_CFG_OUTSTANDING_CNT::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  RD_OS_CNT.read(rdata);
  WR_OS_CNT.read(rdata);
}

// ------------------ ordt_rg_NVDLA_CVIF_STATUS methods ------------------

ordt_rg_NVDLA_CVIF_STATUS::ordt_rg_NVDLA_CVIF_STATUS(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    IDLE(8, 1, 0x1, r_std, w_none) {
}

int  ordt_rg_NVDLA_CVIF_STATUS::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_CVIF_STATUS at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_STATUS\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_CVIF_STATUS::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  IDLE.write(wdata);
}

int  ordt_rg_NVDLA_CVIF_STATUS::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_CVIF_STATUS at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_CVIF_STATUS\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_CVIF_STATUS::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  IDLE.read(rdata);
}

// ------------------ ordt_rset_NVDLA_CVIF methods ------------------

ordt_rset_NVDLA_CVIF::ordt_rset_NVDLA_CVIF(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_regset(_m_startaddress, _m_endaddress),
    CFG_RD_WEIGHT_0(_m_startaddress + 0x0, _m_startaddress + 0x3),
    CFG_RD_WEIGHT_1(_m_startaddress + 0x4, _m_startaddress + 0x7),
    CFG_RD_WEIGHT_2(_m_startaddress + 0x8, _m_startaddress + 0xb),
    CFG_WR_WEIGHT_0(_m_startaddress + 0xc, _m_startaddress + 0xf),
    CFG_WR_WEIGHT_1(_m_startaddress + 0x10, _m_startaddress + 0x13),
    CFG_OUTSTANDING_CNT(_m_startaddress + 0x14, _m_startaddress + 0x17),
    STATUS(_m_startaddress + 0x18, _m_startaddress + 0x1b) {
  m_children.push_back(&CFG_RD_WEIGHT_0);
  m_children.push_back(&CFG_RD_WEIGHT_1);
  m_children.push_back(&CFG_RD_WEIGHT_2);
  m_children.push_back(&CFG_WR_WEIGHT_0);
  m_children.push_back(&CFG_WR_WEIGHT_1);
  m_children.push_back(&CFG_OUTSTANDING_CNT);
  m_children.push_back(&STATUS);
}

void  ordt_rset_NVDLA_CVIF::update_child_ptrs() {
  m_children.clear();
  m_children.push_back(&CFG_RD_WEIGHT_0);
  m_children.push_back(&CFG_RD_WEIGHT_1);
  m_children.push_back(&CFG_RD_WEIGHT_2);
  m_children.push_back(&CFG_WR_WEIGHT_0);
  m_children.push_back(&CFG_WR_WEIGHT_1);
  m_children.push_back(&CFG_OUTSTANDING_CNT);
  m_children.push_back(&STATUS);
}

// ------------------ ordt_root methods ------------------

ordt_root::ordt_root()
  : ordt_root(0x0, 0xf01b) {
}

ordt_root::ordt_root(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_regset(_m_startaddress, _m_endaddress),
    NVDLA_CVIF(_m_startaddress + 0xf000, _m_startaddress + 0xf01f) {
  m_children.push_back(&NVDLA_CVIF);
}

void  ordt_root::update_child_ptrs() {
  m_children.clear();
  m_children.push_back(&NVDLA_CVIF);
}

