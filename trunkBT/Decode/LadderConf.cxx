#include <sstream>
#include <string>

#include "EventUtils.hh"
#include "LadderConf.hh"

LadderConf::LadderConf(){};
LadderConf::~LadderConf(){};

void LadderConf::Init(TString filename, bool DEBUG) {

  int const dimline = 255;
  char line[dimline];
  double dummy;
  int dummyint;
  int jinfnum = 0;
  int tdrnum = 0;

  FILE *ft = fopen(filename.Data(), "r");
  if (ft == NULL) {
    printf("Error: cannot open %s \n", filename.Data());
    return;
  } else {

    while (1) {
      if (fgets(line, dimline, ft) != NULL) {
        if (*line == '#') { /* ignore comment line */
          continue;
        } else {
          LadderParams *params = new LadderParams;

	  //          int firstn =
	  sscanf(line, "%d\t%d\t%lf\t%lf\t%lf\t%lf\t%d\t%d\t%d\t%d\t%lf\t%lf\t%lf\t%lf\t%d", &jinfnum, &tdrnum, &dummy, &dummy,
			      &dummy, &dummy, &dummyint, &dummyint, &dummyint, &dummyint, &dummy, &dummy, &dummy, &dummy, &dummyint);
	  //	  printf("%d) %d %d\n", firstn, jinfnum, tdrnum);
          if (static_cast<size_t>(jinfnum) < NJINF && static_cast<size_t>(tdrnum) < NTDRS) {
            int n = sscanf(line, "%d\t%d\t%lf\t%lf\t%lf\t%lf\t%d\t%d\t%d\t%d\t%lf\t%lf\t%lf\t%lf\t%d", &jinfnum, &tdrnum,
                           &params->_spitch, &params->_kpitch, &params->_sreso, &params->_kreso,
                           (int *)&params->_kmultiflip, (int *)&params->_smirror, (int *)&params->_kmirror,
                           (int *)&params->_bondtype, &params->_shithresh, &params->_slothresh, &params->_khithresh,
                           &params->_klothresh, (int *)&params->_sideswap);
	    //	    printf("%d) %d %d\n", n, jinfnum, tdrnum);
            if (n < params->_nelements) {
              printf("JINF=%d, TDR=%02d: %d elements found, while %d expected: ", jinfnum, tdrnum, n,
                     params->_nelements);
              if (params->_nelements - n == 5) {
                printf("the difference is 5, so is the version 0 of ladderconf, setting the bonding type, "
                       "thresholds and sideswap to default...\n");
                params->_bondtype = 0;
                params->_shithresh = 3.5;
                params->_khithresh = 3.5;
                params->_slothresh = 1.0;
                params->_klothresh = 1.0;
		params->_sideswap = 0;
              } else if (params->_nelements - n == 4) {
                printf("the difference is 4, so is the version 1 of ladderconf, setting thresholds and "
		       "sideswap to default...\n");
                params->_shithresh = 3.5;
                params->_khithresh = 3.5;
                params->_slothresh = 1.0;
                params->_klothresh = 1.0;
		params->_sideswap = 0;
	      } else if (params->_nelements - n == 1) {
                printf("the difference is 1, so is the version 2 of ladderconf, setting sideswap to default...\n");
                params->_sideswap = 0;
              } else
                printf("the difference is %d, SO THIS IS WRONG. PLEASE CHECK THE %s file! **************\n",
                       params->_nelements - n, filename.Data());
            }
            params->_HwId = 100 * jinfnum + tdrnum;
            // params->Dump();
            _ladders.insert(std::pair<int, LadderParams *>(params->_HwId, params));
            // printf("%lu\n", _ladders.size());
          } else {
            printf("Wrong JINF/TDR (%d, %d): maximum is (%ld,%ld)\n", jinfnum, tdrnum, NJINF, NTDRS);
          }
        }
      } else {
        printf(" closing ladderconf file \n");
        fclose(ft);
        break;
      }
    }
  }

  return;
}

bool LadderConf::GetMultiplicityFlip(int jinfnum, int tdrnum) {

  int HwId = 100 * jinfnum + tdrnum;

  if (IsTDRConfigured(jinfnum, tdrnum))
    return _ladders[HwId]->_kmultiflip;
  else
    return false;
}

bool LadderConf::GetStripMirroring(int jinfnum, int tdrnum, int side) {

  int HwId = 100 * jinfnum + tdrnum;

  if (side == 0) {
    if (IsTDRConfigured(jinfnum, tdrnum))
      return _ladders[HwId]->_smirror;
  } else if (side == 1) {
    if (IsTDRConfigured(jinfnum, tdrnum))
      return _ladders[HwId]->_kmirror;
  }

  return false;
}

double LadderConf::GetPitch(int jinfnum, int tdrnum, int side) {

  int HwId = 100 * jinfnum + tdrnum;

  if (side == 0) {
    if (IsTDRConfigured(jinfnum, tdrnum))
      return _ladders[HwId]->_spitch;
  } else if (side == 1) {
    if (IsTDRConfigured(jinfnum, tdrnum))
      return _ladders[HwId]->_kpitch;
  }

  return -999.9;
}

double LadderConf::GetResolution(int jinfnum, int tdrnum, int side) {

  int HwId = 100 * jinfnum + tdrnum;

  if (side == 0) {
    if (IsTDRConfigured(jinfnum, tdrnum))
      return _ladders[HwId]->_sreso;
  } else if (side == 1) {
    if (IsTDRConfigured(jinfnum, tdrnum))
      return _ladders[HwId]->_kreso;
  }

  return -999.9;
}

int LadderConf::GetBondingType(int jinfnum, int tdrnum) {

  int HwId = 100 * jinfnum + tdrnum;

  if (IsTDRConfigured(jinfnum, tdrnum))
    return _ladders[HwId]->_bondtype;

  return 0;
}

double LadderConf::GetSHiThreshold(int jinfnum, int tdrnum) {

  int HwId = 100 * jinfnum + tdrnum;

  if (IsTDRConfigured(jinfnum, tdrnum))
    return _ladders[HwId]->_shithresh;

  return 0;
}

double LadderConf::GetKHiThreshold(int jinfnum, int tdrnum) {

  int HwId = 100 * jinfnum + tdrnum;

  if (IsTDRConfigured(jinfnum, tdrnum))
    return _ladders[HwId]->_khithresh;

  return 0;
}

double LadderConf::GetSLoThreshold(int jinfnum, int tdrnum) {

  int HwId = 100 * jinfnum + tdrnum;

  if (IsTDRConfigured(jinfnum, tdrnum))
    return _ladders[HwId]->_slothresh;

  return 0;
}

double LadderConf::GetKLoThreshold(int jinfnum, int tdrnum) {

  int HwId = 100 * jinfnum + tdrnum;

  if (IsTDRConfigured(jinfnum, tdrnum))
    return _ladders[HwId]->_klothresh;

  return 0;
}

bool LadderConf::GetSideSwap(int jinfnum, int tdrnum) {

  int HwId = 100 * jinfnum + tdrnum;

  if (IsTDRConfigured(jinfnum, tdrnum))
    return _ladders[HwId]->_sideswap;
  
  return 0;
}

void LadderConf::PrintLadderParams(int jinfnum, int tdrnum) {

  int HwId = 100 * jinfnum + tdrnum;

  if (IsTDRConfigured(jinfnum, tdrnum))
    _ladders[HwId]->Dump();

  return;
}

bool LadderConf::IsTDRConfigured(int jinfnum, int tdrnum) {

  int HwId = 100 * jinfnum + tdrnum;

  return IsTDRConfigured(HwId);
}

bool LadderConf::IsTDRConfigured(int HwId) {

  return _ladders.find(HwId) != end(_ladders);
}
