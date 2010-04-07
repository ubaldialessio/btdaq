*  $Id: get.f,v 1.1.1.1 2007/11/13 09:56:10 zuccon Exp $
      subroutine get(idet)
*********************************************************
*                                                       *
* This file was generated by HUWFUN.                    *
*                                                       *
*********************************************************
*
*     Ntuple Id:      1    
*     Ntuple Title:   Simulation
*     Creation:       24/07/96 10.09.21
*
*********************************************************
*
      LOGICAL         CHAIN
      CHARACTER*128   CFILE
      INTEGER         IDNEVT,NCHEVT,ICHEVT
      REAL            OBS(13)
*
      COMMON /PAWIDN/ IDNEVT,OBS
      COMMON /PAWCHN/ CHAIN, NCHEVT, ICHEVT
      COMMON /PAWCHC/ CFILE
*
*--   Ntuple Variable Declarations
*

      REAL Beta,BetaError,BetaChi2,ProbTOF(7),ProbTracker(7),PMass
     + ,PErrMass,PMom,PErrMom,PCharge,PTheta,PPhi,PCoo(3),PAnti
     + ,SignalCTC,BetaCTC,ErrorBetaCTC,CooCTC(3),TOFEdep,TOFTime
     + ,TOFETime,TOFCoo(3),TOFErCoo(3),TOFMCXcoo(3),TOFMCtof,TOFMCedep
     + ,Sum,Sigma,Mean,RMS,ErrorMean,SS(5,2),Xca(3),Xcb(3),Xgl(3),SumMC
     + ,HitR(3),EhitR(3),SumR,DifoSum,Chi2StrLine,Chi2Circle
     + ,CircleRidgidity,Chi2FastFit,Ridgidity,ErrRidgidity,Theta,Phi
     + ,P0(3),GChi2,GRidgidity,GErrRidgidity,GTheta,GPhi,GP0(3),HChi2(2)
     + ,HRidgidity(2),HErrRidgidity(2),HTheta(2),HPhi(2),HP0(3,2)
     + ,FChi2MS,GChi2MS,RidgidityMS,GRidgidityMS,Coo(3),Dir(3),Momentum
     + ,Mass,Charge,CTCCoo(3),CTCErCoo(3),CTCRawSignal,CTCSignal
     + ,CTCESignal,CTCMCXcoo(3),CTCMCXdir(3),CTCstep,CTCedep,CTCbeta,
     + Amplitude(5)
      INTEGER EventNo,Run,RunType,Time(2),BetaEvent,BetaPattern
     + ,ChargeEvent,ChargeBetaP,ChargeTOF,ChargeTracker,ParticleEvent
     + ,PBetaPointer,PChargePointer,PtrackPointer,ParticleId,TOFCluster
     + ,TOFStatus,Ntof,Plane,TOFMCEvent,TOFMCIdsoft,TrCluster,Idsoft
     + ,Status,NelemL,NelemR,TrMCCluster,IdsoftMC,Itra,Left(2),Center(2)
     + ,Right(2),TrRecHit,StatusR,Layer,TrTrack,TrStatus,Pattern,NHits
     + ,GeaneFitDone,AdvancedFitDone,EventNoMCEventG,Particle,CTCCluster
     + ,CTCStatus,CTCMCEvent,CTCMCIdsoft,px,py
*

*
*
*
*
*    idet=1
*
      common /eventhC/eventno,run,runtype,time

*
*    idet=2
*
      common /betaC/betaevent,betapattern,beta,betaerror,betachi2
*
*    idet=3
*

      common /chargeC/chargeevent,chargebetap,chargetof,
     + chargetracker,probtof,probtracker

*
*    idet=4
*

      common/particleC/particleevent,pbetapointer,pchargepointer,
     + ptrackpointer,particleid,pmass,perrmass,pmom,perrmom,pcharge,
     + ptheta,pphi,pcoo,panti,signalctc,betactc,errorbetactc,cooctc
*
*    idet=5
*

      common /tofclustC/ TOFCluster,TOFStatus,Ntof,Plane,TOFEdep,
     + TOFTime,TOFETime,TOFCoo,TOFErCoo

*
*    idet=6
*
       common /tofmcccluC/TOFMCEvent,TOFMCIdsoft,TOFMCXcoo,TOFMCtof,
     +  TOFMCedep

*
*    idet=7
*
       common /trclusteC/TrCluster,Idsoft,Status,NelemL,
     + NelemR,Sum,Sigma,Mean,RMS,ErrorMean
*
*    idet=8
*
       common /trmcclusC/TrMCCluster,IdsoftMC,Itra,Left,Center,
     +  Right,ss,xca,xcb,xgl,summc
*
*    idet=9
*

      common /trrechitC/TrRecHit,px,py,
     +statusr,Layer,hitr,ehitr,sumr,difosum

*
*    idet=10
*
      common /trtrackC/trtrack,trstatus,pattern,nhits,GeaneFitDone,
     + AdvancedFitDone,Chi2StrLine,Chi2Circle,CircleRidgidity,
     + Chi2FastFit,Ridgidity,ErrRidgidity,Theta,phi,p0,gchi2,
     + gridgidity,gerrridgidity,gtheta,gphi,gp0,hchi2,
     + HRidgidity,HErrRidgidity,htheta,hphi,hp0,fchi2ms,gchi2ms,
     + ridgidityms,gridgidityms
*
*    idet=11
*

      common /mceventgC/EventNoMCEventG,Particle,coo,dir,
     + momentum,mass,charge

*
*    idet=12
*
     
      common /ctcclustC/CTCCluster,CTCStatus,ctccoo,ctcercoo,
     + ctcrawsignal,ctcsignal,ctcesignal

*
*    idet=13
*

      common /ctcmccluC/CTCMCEvent, CTCMCIdsoft,CTCMCXcoo,
     + CTCMCXdir,CTCstep,ctcedep,ctcbeta
      character *64 cdet
      parameter (ndet=13)
      character *64 cblock(ndet)
      integer events(10000),nevent
*
*--   Enter user code here
*
       cblock(1)='EVENTH'
       cblock(2)='BETA'
       cblock(3)='CHARGE'
       cblock(4)='PARTICLE'
       cblock(5)='TOFCLUST'
       cblock(6)='TOFMCCLU'
       cblock(7)='TRCLUSTE'
       cblock(8)='TRMCCLUS'
       cblock(9)='TRRECHIT'
       cblock(10)='TRTRACK'
       cblock(11)='MCEVENTG'
       cblock(12)='CTCCLUST'
       cblock(13)='CTCMCCLU'
       if(idet.le.0.or.idet.gt.ndet)then
        write(*,*)'Invalid Idet ',idet
        goto 999
       else 
        write(*,*)cblock(idet)(1:10), ' called'
       endif

 100   call hbname(1,' ',0,'$CLEAR')
       if(cblock(idet).eq.'TOFCLUST')then     
*
* TOFCluster
*
        call hbname(1,'TOFClust',TOFcluster,'$SET')
        call hbook1(501,'tofedep',50,0.,5.,0.)
        call hbook1(5011,'tofedep',45,0.5,5.,0.)
        call hbook1(502,'plane',14,0.5,14.5,0.)
        call hbook1(503,'ntof',4,0.5,4.5,0.)
       endif
       if(cblock(idet).eq.'TRCLUSTE')then     
*
* TrCluster
*
        call hbname(1,'TrCluste',TrCluster,'$SET')
        call hbook1(701,'tredep',100,0.,1000.,0.)
        call hbook1(702,'ladder',17,0.5,17.5,0.)
        call hbook1(703,'layer',6,0.5,6.5,0.)
       endif
       if(cblock(idet).eq.'MCEVENTG')then
*
* MCEventG
*
        call hbname(1,'MCEventG',EventNoMCEventG,'$SET')
        call hbook1(1104,'parfcoo',100,-200.,200.,0.)
        call hbook1(1105,'parcoo',100,-200.,200.,0.)
        call hbook1(1106,'parcoo',100,-200.,200.,0.)
        call hbook1(1107,'momentum',100,0.,10.,0.)
        call hbook1(1108,'dir3',100,-1.,1.,0.)
       endif
       if(cblock(idet).eq.'BETA')then
         call hbname(1,'Beta',betaevent,'$SET')
         call hbook1(201,'beta',200,-2.,2.,0.)
       endif
       nmax=1000000000
       ierr=0
       do i=1,nmax
        call hgntb(1,cblock(idet),i,ierr)
         if(ierr.ne.0)goto 999
        if(cblock(idet).eq.'BETA')then
          call hf1(201,beta,1.)
        endif
         if(cblock(idet).eq.'MCEVENTG')then 
          r=coo(1)
          call hf1(1104,r,1.)
          r=coo(2)
          call hf1(1105,r,1.)
          r=coo(3)
          call hf1(1106,r,1.)
          r=momentum*1000
          call hf1(1107,r,1.)
          r=dir(3)
          call hf1(1108,r,1.)
         endif
         if(cblock(idet).eq.'TOFCLUST')then
          r=tofedep
          call hf1(501,r,1.)
          call hf1(5011,r,1.)
          if(ntof.eq.3)call hf1(502,float(plane),1.)
          call hf1(503,float(ntof),1.)
         endif     
         if(cblock(idet).eq.'TRCLUSTE')then
          r=sum
          call hf1(701,r,1.)
          if(mod(idsoft,10).eq.6)call hf1(702,
     +    float(mod(idsoft/10,100)),1.)
          call hf1(703,float(mod(idsoft,10)),1.)
         endif 
       enddo 
 
*
 999   close (21)
      END
        function bs(a,event,nevent)
        integer a(nevent),event
        ia=1
        il=1
        ir=1
        ib=nevent
        j=0
 777    if(ia .lt.ib-1)then
          k=(ia+ib)/2
          if(a(k).eq.event)then
           bs=-1
           return
          else if(event.gt.a(k))then
            ia=k
            il=0
            goto 777
          else
           ib=k
           ir=0
           goto 777
          endif
        endif
        if(ir.ne.0)then
         if(nevent.eq.a(ib))then
          bs=-1
          return
         else if(nevent.gt.a(ib))then
          bs=ib
          return
         endif
        else if(il.ne.0)then
         if(nevent.eq.a(ia))then
          bs=-1
          return   
         else if(nevent.lt.a(ia))then
          bs=ia
          return
         endif
        endif
        bs=ib
        return
        end
