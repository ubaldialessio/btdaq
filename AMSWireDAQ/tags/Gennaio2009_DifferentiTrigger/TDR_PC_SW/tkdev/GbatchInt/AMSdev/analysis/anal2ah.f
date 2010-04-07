*  $Id: anal2ah.f,v 1.1.1.1 2007/11/13 09:56:10 zuccon Exp $
      REAL FUNCTION anal2ah(init)
*********************************************************
*                                                       *
* This file was generated by HUWFUN.                    *
*                                                       *
*********************************************************
*
*     Ntuple Id:      1    
*     Ntuple Title:   Converted Ntuple
*     Creation:       17/10/96 20.42.24
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
*
*--   Ntuple Variable Declarations
*

      REAL RadS,ThetaS,PhiS,YawS,PitchS,RollS,VelocityS,VelTheta,VelPhi
     + ,beta(100),betaerror(100),betachi2(100),betachi2s(100)
     + ,probtof(10,10),probtracker(10,10),truntof(10),truntracker(10)
     + ,pmass(10),perrmass(10),pmom(10),perrmom(10),pcharge(10)
     + ,ptheta(10),pphi(10),thetagl(10),phigl(10),pcoo(3,10)
     + ,signalctc(2,10),betactc(2,10),errorbetactc(2,10),cooctc(3,2,10)
     + ,cootof(3,4,10),cooanti(3,2,10),cootr(3,6,10),TOFEdep(20)
     + ,TOFTime(20),TOFETime(20),TOFCoo(3,20),TOFErCoo(3,20)
     + ,TOFMCXcoo(3,200),TOFMCtof(200),TOFMCedep(200),Sumt(200)
     + ,Sigmat(200),Meant(200),RMSt(200),ErrorMeant(200)
     + ,Amplitude(5,200),ss(5,2,200),xca(3,200),xcb(3,200),xgl(3,200)
     + ,summc(200),hitr(3,500),ehitr(3,500),sumr(500),difosum(500)
     + ,Chi2StrLine(20),Chi2Circle(20),CircleRidgidity(20)
     + ,Chi2FastFit(20),Ridgidity(20),ErrRidgidity(20),Theta(20),phi(20)
     + ,p0(3,20),gchi2(20),gridgidity(20),gerrridgidity(20),gtheta(20)
     + ,gphi(20),gp0(3,20),hchi2(2,20),HRidgidity(2,20)
     + ,HErrRidgidity(2,20),htheta(2,20),hphi(2,20),hp0(3,2,20)
     + ,fchi2ms(20),gchi2ms(20),ridgidityms(20),gridgidityms(20)
     + ,coo(3,20)
      INTEGER eventno,run,runtype,time(2),RawWords,Particles,Tracks
     + ,Betas,Charges,TrRecHits,TrClusters,TrRawClusters,TrMCClusters
     + ,TOFClusters,TOFMCClusters,CTCClusters,CTCMCClusters
     + ,AntiMCClusters,AntiClusters,EventStatus,nbeta,betastatus(100)
     + ,betapattern(100),betantof(100),betaptof(4,100),betaptr(100)
     + ,ncharge,chargestatus(10),chargebetap(10),chargetof(10)
     + ,chargetracker(10),npart,pctcp(2,10),pbetap(10),pchargep(10)
     + ,ptrackp(10),pid(10),ntof,TOFStatus(20),plane(20),bar(20),ntofmc
     + ,TOFMCIdsoft(200),Ntrcl,Idsoft(200),Statust(200),NelemL(200)
     + ,NelemR(200),ntrclmc,IdsoftMC(200),Itra(200),Left(2,200)
     + ,Center(2,200),Right(2,200),ntrrh,px(500),py(500),statusr(500)
     + ,Layer(500),ntrtr,trstatus(20),pattern(20),nhits(20),phits(6,20)
     + ,FastFitDone(20),GeaneFitDone(20),AdvancedFitDone(20),nmcg
     + ,nskip(20),Particle(20),nctccl,CTCStatus(20),CTCLayer(20)
     + ,nctcclmc,CTCMCIdsoft(200),nanti,AntiStatus(16),AntiSector(16)
     + ,nantimc,AntiMCIdsoft(200),nlvl3,LVL3TOFTr(2),LVL3AntiTr(2)
     + ,LVL3TrackerTr(2),LVL3NTrHits(2),LVL3NPat(2),LVL3Pattern(2,2)
     + ,nlvl1,LVL1LifeTime(2),LVL1Flag(2),LVL1TOFPatt(4,2)
     + ,LVL1TOFPatt1(4,2)
      REAL dir(3,20),momentum(20),mass(20),charge(20),ctccoo(3,20)
     + ,ctcercoo(3,20),ctcrawsignal(20),ctcsignal(20),ctcesignal(20)
     + ,CTCMCXcoo(3,200),CTCMCXdir(3,200),CTCstep(200),ctccharge(200)
     + ,ctcbeta(200),ctcedep(200),AntiEdep(16),AntiCoo(3,16)
     + ,AntiErCoo(3,16),AntiMCXcoo(3,200),AntiMCtof(200),AntiMCedep(200)
     + ,LVL3Residual(2,2),LVL3Time(2),LVL3ELoss(2),ctchitsignal(50)
     + ,s2n(500),antirawsignal(32),tofrtovta(2,20),tofrtovtd(2,20)
     + ,tofrsdtm(2,20)
      INTEGER LVL1AntiPatt(2),nctcht,CTChitStatus(50),CTChitLayer(50)
     + ,ctchitcolumn(50),ctchitrow(50),ntrraw,rawaddress(500)
     + ,rawlength(500),nantiraw,antirawstatus(32),antirawsector(32)
     + ,antirawupdown(32),ntofraw,tofrstatus(20),tofrplane(20)
     + ,tofrbar(20)
*
      COMMON /PAWCR4/ eventno,run,runtype,time,RawWords,RadS,ThetaS,PhiS
     + ,YawS,PitchS,RollS,VelocityS,VelTheta,VelPhi,Particles,Tracks
     + ,Betas,Charges,TrRecHits,TrClusters,TrRawClusters,TrMCClusters
     + ,TOFClusters,TOFMCClusters,CTCClusters,CTCMCClusters
     + ,AntiMCClusters,AntiClusters,EventStatus,nbeta,betastatus
     + ,betapattern,beta,betaerror,betachi2,betachi2s,betantof,betaptof
     + ,betaptr,ncharge,chargestatus,chargebetap,chargetof,chargetracker
     + ,probtof,probtracker,truntof,truntracker,npart,pctcp,pbetap
     + ,pchargep,ptrackp,pid,pmass,perrmass,pmom,perrmom,pcharge,ptheta
     + ,pphi,thetagl,phigl,pcoo,signalctc,betactc,errorbetactc,cooctc
     + ,cootof,cooanti,cootr,ntof,TOFStatus,plane,bar,TOFEdep,TOFTime
     + ,TOFETime,TOFCoo,TOFErCoo,ntofmc,TOFMCIdsoft,TOFMCXcoo,TOFMCtof
     + ,TOFMCedep,Ntrcl,Idsoft,Statust,NelemL,NelemR,Sumt,Sigmat,Meant
     + ,RMSt,ErrorMeant,Amplitude,ntrclmc,IdsoftMC,Itra,Left,Center
     + ,Right,ss,xca,xcb,xgl,summc,ntrrh,px,py,statusr,Layer,hitr,ehitr
     + ,sumr,difosum,ntrtr,trstatus,pattern,nhits,phits,FastFitDone
     + ,GeaneFitDone,AdvancedFitDone,Chi2StrLine,Chi2Circle
     + ,CircleRidgidity,Chi2FastFit,Ridgidity,ErrRidgidity,Theta,phi,p0
     + ,gchi2,gridgidity,gerrridgidity,gtheta,gphi,gp0,hchi2,HRidgidity
     + ,HErrRidgidity,htheta,hphi,hp0,fchi2ms,gchi2ms,ridgidityms
     + ,gridgidityms,nmcg,nskip,Particle,coo,dir,momentum,mass,charge
     + ,nctccl,CTCStatus,CTCLayer,ctccoo,ctcercoo,ctcrawsignal,ctcsignal
     + ,ctcesignal,nctcclmc,CTCMCIdsoft,CTCMCXcoo,CTCMCXdir,CTCstep
     + ,ctccharge,ctcbeta,ctcedep,nanti,AntiStatus,AntiSector,AntiEdep
     + ,AntiCoo,AntiErCoo,nantimc,AntiMCIdsoft,AntiMCXcoo,AntiMCtof
     + ,AntiMCedep,nlvl3,LVL3TOFTr,LVL3AntiTr,LVL3TrackerTr,LVL3NTrHits
     + ,LVL3NPat,LVL3Pattern,LVL3Residual,LVL3Time,LVL3ELoss,nlvl1
     + ,LVL1LifeTime,LVL1Flag,LVL1TOFPatt,LVL1TOFPatt1,LVL1AntiPatt
     + ,nctcht,CTChitStatus,CTChitLayer,ctchitcolumn,ctchitrow
     + ,ctchitsignal,ntrraw,rawaddress,rawlength,s2n,nantiraw
     + ,antirawstatus,antirawsector,antirawupdown,antirawsignal,ntofraw
     + ,tofrstatus,tofrplane,tofrbar,tofrtovta,tofrtovtd,tofrsdtm

*
*
* Variable Declarations
*



*

*
*--   Enter user code here
*
      vector ista(1)
      vector nonzerob(10000)
      integer ladder(6),half(6)
      vector ioffset(6),ihalf(6),icumulus(6)
      integer position(14,14)
      logical cuts(10)      
      integer init,wide
      vector iar1(999999)
c      vector iar2(999999)
       integer idsofttr(5,200)
      parameter(nchx=384)
      parameter(nchy=642)
      if(init.eq.0)then
        do i=1,999999
          if(ista(1).lt.4)iar1(i)=0
c          iar2(i)=0
        enddo
        ioffset(1)=7
        ioffset(2)=4
        ioffset(3)=4
        ioffset(4)=4
        ioffset(5)=4
        ioffset(6)=7
        ihalf(1)=4
        ihalf(2)=6
        ihalf(3)=6
        ihalf(4)=6
        ihalf(5)=6
        ihalf(6)=3
        icumulus(1)=1
        do i=2,6
         icumulus(i)=icumulus(i-1)*(2*ihalf(i-1)+1)
         write(*,*)i,icumulus(i)
        enddo
         call hbook1(2,'Nparticles',20,-0.5,19.5,0.)
         call hbook1(11,'Trclusters',200,-0.5,199.5,0.)
         call hbook1(12,'TOFclusters',50,-0.5,49.5,0.)
         call hbook1(15,'TOFclusters',50,-0.5,49.5,0.)
         call hbook1(13,'k.e. before',50,0.15,5.15,0.)
         call hbook1(14,'k.e. before',20,0.1,4.1,0.)
         call hbook1(21,'iptr',20,-0.5,19.5,0.)
         call hbook1(101,'ratio',100,0.,10.,0.)  
         call hbook1(201,'chi2 circle',100,0.,20.,0.)
         call hbook1(202,'chi2 fastfit',100,0.,20.,0.)
         call hbook1(301, 'p1/p2',200,0.,3.,0.)
         call hbook1(302, 'p1/p2',200,-3.,0.,0.)
         call hbook1(401,'chi c',100,0.,20.,0.)
         call hbook1(402,'chi f ',100,0.,20.,0.)
         call hbook1(403,'chi str',100,0.,100.,0.)
         call hbook1(451,'chi c',100,0.,20.,0.)
         call hbook1(452,'chi f ',100,0.,20.,0.)
         call hbook1(453,'chi str',100,0.,100.,0.)
         call hbook1(454,'chi k',100,0.,100.,0.)
         call hbook1(455,'chi h',100,0.,200.,0.)
         call hbook1(456,'chi h',100,0.,200.,0.)
         call hbook1(461,'theta diff',200,-0.002,0.002,0.)
         call hbook1(1461,'theta diff',200,-3.,3.,0.)
         call hbook1(462,'beta chi2',200,0.,10.,0.)         
         call hbook1(501,'phi diff',200,-0.05,0.05,0.)
         call hbook1(601, 'p1/p2',200,0.,3.,0.)
         call hbook1(602, 'p1-p2/p',200,-2.,2.,0.)
         call hbook1(701,'anti',100,0.,10.,0.)
         call hbook1(702,' ',100,0.,50.,0.)
         call hbook1(703,'TOFclusters',50,-0.5,49.5,0.)
         call hbook1(1702,' ',100,0.,50.,0.)
         call hbook1(801,'dchi',200,0.,10.,0.)
         call hbook1(901, 'p1/p2',200,-1.,3.,0.)
         call hbook1(902 ,'theta dif',200,-0.02,0.02,0.)
         call hbook1(903,'phi diff',200,-0.05,0.05,0.)
         call hbook1(904,'dist 1',100,-0.005,0.005,0.)
         call hbook1(905,'dist 2',100,-0.001,0.001,0.)
         call hbook1(906,'dist 3',100,-0.-0.05,0.05,0.)
         call hbook1(907,'chi dif',200,0.,10.,0.)
         call hbook1(908,'dist 4',100,0.,0.05,0.)
         call hbook1(961,'pat',26,-0.5,25.5,0.)
         call hbook1(962,'mom',100,-50,0.,0.)
         call hbook1(963,'mom g',100,0,50.,0.)
         call hbook1(964,'mom/g',100,-2.,0.,0.)
         call hbook1(965,'charge',9,0.5,9.5,0.)
         call hbook1(966,'beta',110,0.,1.1,0.)
         call hbook1(967,'mass',200,0.,5.,0.)
         call hbook1(968,'mass',200,0.5,5.,0.)
         call hbook1(969,'anti',100,0.,10.,0.)
         call hbook1(970,'signal CTC',100,-0.25,49.75,0.)
         call hbook1(972,'signal CTC',200,-0.25,99.75,0.)
         call hbook1(973,'beta',200,0.1,1.1,0.)
         call hbook2(971,'cx vx y',100,-100.,100.,100,-100.,100.,0.) 

         call hbook1(1901, 'p1/p2',200,-1.,3.,0.)
         call hbook1(1902 ,'theta dif',200,-0.02,0.02,0.)
         call hbook1(1903,'phi diff',200,-0.05,0.05,0.)
         call hbook1(1904,'dist 1',100,-0.005,0.005,0.)
         call hbook1(1905,'dist 2',100,-0.001,0.001,0.)
         call hbook1(1906,'dist 3',100,-0.-0.05,0.05,0.)
         call hbook1(1907,'chi dif',200,0.,10.,0.)
         call hbook1(1908,'dist 4',100,0.,0.05,0.)
         call hbook1(1961,'pat',20,-0.5,19.5,0.)
         call hbook1(2961,'pat',20,-0.5,19.5,0.)
         call hbook1(1972,'ke',20,0.125,5.125,0.)
         call hbook1(1962,'mom',200,-20,0.,0.)
         call hbook1(1963,'mom g',200,0,50.,0.)
         call hbook1(1964,'mom/g',200,-2.,0.,0.)
         call hbook1(1965,'charge',9,0.5,9.5,0.)
         call hbook1(1966,'beta',110,0.,1.1,0.)
         call hbook1(1967,'mass',200,0.,10.,0.)
         call hbook1(1973,'mass',200,0.,10.,0.)
         call hbook1(1968,'mass',200,0.6,5.,0.)
         call hbook1(1969,'anti',100,0.,10.,0.)
         call hbook1(1912,'TOFclusters',50,-0.5,49.5,0.)
         call hbook1(1970,'beta chi2',200,0.,10.,0.)         

         call hbook1(11901, 'p1/p2',200,-1.,3.,0.)
         call hbook1(11902 ,'theta dif',200,-0.02,0.02,0.)
         call hbook1(11903,'phi diff',200,-0.05,0.05,0.)
         call hbook1(11904,'dist 1',100,-0.005,0.005,0.)
         call hbook1(11905,'dist 2',100,-0.001,0.001,0.)
         call hbook1(11906,'dist 3',100,-0.-0.05,0.05,0.)
         call hbook1(11907,'chi dif',200,0.,10.,0.)
         call hbook1(11908,'dist 4',100,0.,0.05,0.)
         call hbook1(11961,'pat',20,-0.5,19.5,0.)
         call hbook1(11972,'ke',20,0.125,5.125,0.)
         call hbook1(11962,'mom',200,-20,0.,0.)
         call hbook1(11963,'mom g',200,0,50.,0.)
         call hbook1(11964,'mom/g',200,-2.,0.,0.)
         call hbook1(11965,'charge',9,0.5,9.5,0.)
         call hbook1(11966,'beta',110,0.,1.1,0.)
         call hbook1(11967,'mass',200,0.,5.,0.)
         call hbook1(11973,'mass',200,0.,5.,0.)
         call hbook1(11968,'mass',200,0.6,5.,0.)
         call hbook1(11969,'anti',100,0.,10.,0.)
         call hbook1(11912,'TOFclusters',50,-0.5,49.5,0.)
         call hbook1(11970,'beta chi2',200,0.,10.,0.)         
         call hbook1(12000,'Eff',200,0.001,1.001,0.)
         call hbook1(12001,'Rate',200,0.,4000.,0.)
         call hbook2(12002,'ER',100,0.,4000.,100,0.001,1.001,0.)
         call hbook1(1013,'k.e. before',50,0.15,5.15,0.)
         call hbook1(1014,'k.e. before',20,0.1,4.1,0.)
         call hbook1(11013,'k.e. before',50,0.15,5.15,0.)
         call hbook1(11014,'k.e. before',20,0.1,4.1,0.)
ccc         do i=1,1200
c          call hbook1(21000+i,'x',80,-80.,80.,0.)
c          call hbook1(23000+i,'y',80,-80.,80.,0.)
c          call hbook1(25000+i,'theta',80,-1.,1.,0.)
c          call hbook1(27000+i,'phi',80,-1.,1.,0.)
c         enddo
        init=1
        return
      endif
      ijk=ijk+1
      do i=1,10
         cuts(i)=.false.
      enddo
      nwide=0
      delta=0 
      ndelta=0
      nx=0
      ny=0
      maxcl=50
                    panti=0
                    do i=1,nanti
                     panti=panti+antiedep(i)
                    enddo
      do i=1,ntrcl
       idsofttr(1,i)=mod(idsoft(i),10)
       idsofttr(2,i)=mod(idsoft(i)/10,100)
       ir=mod(idsoft(i)/1000,10)
       if(ir.eq.0)then
        idsofttr(3,i)=0
        idsofttr(4,i)=0
       else if(ir.eq.1)then
        idsofttr(3,i)=0
        idsofttr(4,i)=1
       else if(ir.eq.2)then
        idsofttr(3,i)=1
        idsofttr(4,i)=0
       else 
        idsofttr(3,i)=1
        idsofttr(4,i)=1
       endif
       idsofttr(5,i)=mod(idsoft(i)/10000,1000)
      enddo
      if(npart.gt.0.and.pcharge(1).eq.2.)then
      call hf1(2,float(npart),1.)
      goto 777
      if(npart.eq.1.and.beta(pbetap(1)).gt.0.8)then
        iptr=ptrackp(1)
        iad=0
        nl=0
        n16=0
        do i=1,nhits(iptr)
         ila=layer(phits(i,iptr))
         ipy=py(phits(i,iptr))
         if(ila.eq.1.or.ila.eq.6)n16=1
         if(ipy.lt.500)then
          nl=nl+1
          if(idsofttr(4,ipy).gt.1)write(*,*)idsofttr(4,ipy)
          lad=idsofttr(2,ipy)-ioffset(ila)+idsofttr(4,ipy)*
     +    (ihalf(ila)+1)
          iad=iad+icumulus(ila)*lad
          endif
        enddo
         nl=nl-n16
         if(nl.ge.4)then
          if(ista(1).eq.4)then
          do j=1,1200
          if(iad.eq.nonzerob(j))then
            call hf1(21000+j,cootof(1,1,1),1.)
            call hf1(23000+j,cootof(2,1,1),1.)
            call hf1(25000+j,sin(ptheta(1))*cos(pphi(1)),1.)
            call hf1(27000+j,sin(ptheta(1))*sin(pphi(1)),1.)
           endif
          enddo
           endif
          if(iad.lt.1000000)then
           if(ista(1).eq.1) iar1(iad)=iar1(iad)+1
         else if(iad.lt.1999999)then 
           if(ista(1).eq.2)iar1(iad-999999)=iar1(iad-999999)+1
         else if(ista(1).eq.3)then
           if(ista(1).eq.3)
     +     iar1(iad-999999-999999)=iar1(iad-999999*2)+1 
         endif
         endif
        return 
 777               continue
*
* Trigger
*
c      trigger=0
c      do i=1,ntof
c        if(plane(i).eq.1)then
c         do j=1,ntof
c          if(plane(j).eq.4)then
c                       
c            if(position(bar(i),bar(j)).eq.1)trigger=1
c          endif
c         enddo 
c        endif
c      enddo       
c     
       u=sin(ptheta(1))*cos(pphi(1))
       v=sin(ptheta(1))*sin(pphi(1))
       w=cos(ptheta(1))
       call hf1(11,float(trclusters),1.)
       call hf1(12,float(tofclusters),1.)
       trigger=1
       if(trigger.eq.1)call hf1(15,float(tofclusters),1.)
       cuts(1)=trclusters.lt.200.and.trrechits.lt.500.and.
     +  tracks.lt.20.and.trigger.eq.1
       iptr=ptrackp(1)
       call hf1(2961,float(pattern(iptr)),1.)
       call hf1(21,float(iptr),1.)
       if(cuts(1))then
        r=float(ntrcl)/nhits(iptr)
        call hf1(101,r,1.)
        cuts(2)=r.lt.20.
        if(cuts(2))then
         cuts(3)=chi2circle(iptr).lt.2.5.and.
     +   chi2fastfit(iptr).lt.10.
         call hf1(201,chi2circle(iptr),1.)
         call hf1(202,chi2fastfit(iptr),1.)
         if(cuts(3))then  
          cuts(4)=advancedfitdone(iptr).eq.0 .or.
     +    (gridgidity(iptr).lt.0.and.hridgidity(1,iptr).lt.0.and.
     +    hridgidity(2,iptr).lt.0)
          if(cuts(4) )then
           if(pmom(1).gt.0.5)then
            call hf1(401,chi2circle(iptr),1.)
            call hf1(402,chi2fastfit(iptr),1.)
            call hf1(403,chi2strline(iptr),1.)
           else if(pmom(1).lt.0)then
            call hf1(451,chi2circle(iptr),1.)
            call hf1(452,chi2fastfit(iptr),1.)
            call hf1(453,chi2strline(iptr),1.)
            if(geanefitdone(iptr).ne.0)then
               call hf1(454,gchi2(iptr),1.)
               call hf1(455,fchi2ms(iptr),1.)
               call hf1(456,gchi2ms(iptr),1.)
               if(htheta(2,iptr).lt.3.14159267/2)
     +         htheta(2,iptr)=3.14159267-htheta(2,iptr)
               if(advancedfitdone(iptr).ne.0..and.
     +         hchi2(1,iptr).lt.1.e10.and.hchi2(2,iptr).lt.1.e10)then
                 call hf1(1461,htheta(2,iptr)-htheta(1,iptr),1.)
                 call hf1(461,htheta(2,iptr)-htheta(1,iptr),1.)
                 call hf1(462,betachi2(pbetap(1)),1.)
                 cuts(5)=abs(htheta(2,iptr)-htheta(1,iptr)).lt.
     +           0.8e-3+0.15e-3/abs(pmom(1))
                  if(cuts(5))then
                   rp= asin(sin(hphi(2,iptr)-hphi(1,iptr)))
                   call hf1(501,rp,1.)
                   cuts(6)=
     +             abs(rp).lt.0.003/abs(pmom(1))
                   if(cuts(6))then
                   r1=gridgidity(iptr)/hridgidity(1,iptr)
                   r2=gridgidity(iptr)/hridgidity(2,iptr)
                     rx=(hridgidity(1,iptr)-hridgidity(2,iptr))/
     +               gridgidity(iptr)
                   cuts(7)=r1.gt.0.5.and.r1.lt.2.
                   cuts(8)=r2.gt.0.5.and.r2.lt.2.
c                   cuts(7)=abs(rx).lt.1.
c                   cuts(8)=.true.
                   call hf1(601,r1,1.)
                   call hf1(601,r2,1.)
                     call hf1(602,rx,1.)
                   if(cuts(7).and.cuts(8))then
                    call hf1(701,panti,1.)
                    call hf1(703,float(tofclusters),1.)
                    r=chi2fastfit(iptr)-hchi2(1,iptr)-hchi2(2,iptr)
                    call hf1(801,r,1.)
                    cuts(9)=panti.lt.0.5.and.tofclusters.lt.5.and.
     +              betachi2(pbetap(1)).lt.5..and.r.lt.2.
*
* Cerenkov cuts
*
                    xll=-570.
                    xlr=580.
                    yll=-380.
                    ylr=430.
                    xx=0
                    do i=1,nctcht
                     xx=xx+ctchitsignal(i)
                    enddo
                    if(cuts(9).and.xx.lt.1)then
                      call hf1(973,abs(beta(pbetap(1))),1.)
                    endif                    
                    cuts(9)=cuts(9).and.
     +              cooctc(1,1,1).gt.xll.and.
     +              cooctc(1,1,1).lt.xlr.and.
     +              cooctc(2,1,1).gt.yll.and.
     +              cooctc(2,1,1).lt.ylr
                    call hf1(970,xx,1.)
                    if(cuts(9))then
                      call hf1(972,xx,1.)
                    endif
                    call hf2(971,cooctc(1,1,1),cooctc(2,1,1),1.)
                    cuts(9)=cuts(9).and.xx.lt.100.or.
     +              abs(beta(pbetap(1))).lt.0.
                    if(cuts(9))then
                    do i=1,ntrclmc
                     call hf1(702,float(itra(i)),1.)
                    enddo
                     call hf1(901,gridgidity(iptr)/hridgidity(1,iptr)
     +               ,1.)
                     call hf1(901,gridgidity(iptr)/hridgidity(2,iptr)
     +               ,1.)
                     call hf1(902,htheta(2,iptr)-htheta(1,iptr),1.)
                     call hf1(903,hphi(2,iptr)-hphi(1,iptr),1.)
                     call hf1(904,hp0(1,2,iptr)-hp0(1,1,iptr),1.)
                     call hf1(905,hp0(2,2,iptr)-hp0(2,1,iptr),1.)
                     call hf1(906,hp0(3,2,iptr)-hp0(3,1,iptr),1.)
                     call hf1(907,
     +               chi2fastfit(iptr)-hchi2(1,iptr)-hchi2(2,iptr),1.)
                     r1=(gp0(1,iptr)-hp0(1,1,iptr))**2+
     +                  (gp0(2,iptr)-hp0(2,1,iptr))**2+
     +                  (gp0(3,iptr)-hp0(3,1,iptr))**2
                     r1=sqrt(r1)
                     r2=(gp0(1,iptr)-hp0(1,2,iptr))**2+
     +                  (gp0(2,iptr)-hp0(2,2,iptr))**2+
     +                  (gp0(3,iptr)-hp0(3,2,iptr))**2
                     r2=sqrt(r2)
                    call hf1(908,r1,1.)
                    call hf1(908,r2,1.)
                    call hf1(962,pmom(1),1.)
                    call hf1(965,charge(1),1.)
                    call hf1(966,beta(1),1.)
                    call hf1(967,pmass(1),1.)
                    call hf1(968,pmass(1),1.)
                    call hf1(969,panti,1.)
                    r=chi2fastfit(iptr)-hchi2(1,iptr)-hchi2(2,iptr)
                    call hf1(1973,pmass(1),1.)
                    xp=perrmass(1)
                    if(xp.gt.1.e6)xp=1.e6
                    if((pmass(1)+xp*1.5.gt.3.2.and.
     +                 pmass(1)-xp*1.5.lt.3.7).and.
     +                 probtof(3,1)*probtracker(3,1).gt.0.06)then
                      write(*,*)run,eventno,pmass(1),pmom(1),pcharge(1),
     +               probtof(pcharge(1)+1,1)*probtracker(pcharge(1)+1,1)
     +               ,pattern(iptr)
                     write(26,*)run,eventno,pmass(1),pmom(1)
                     call hf1(961,float(pattern(iptr)),1.)
                     call hf1(21001+pattern(iptr),cootof(1,1,1),1.)
                     call hf1(22001+pattern(iptr),cootof(2,1,1),1.)
                     call hf1(24001+pattern(iptr),
     +               pphi(1)*180./3.14159,1.)
                     call hf1(23001+pattern(iptr),
     +               ptheta(1)*180./3.14159,1.)
                     call hf1(21000,cootof(1,1,1),1.)
                     call hf1(22000,cootof(2,1,1),1.)
                     call hf1(24000,
     +               pphi(1)*180./3.14159,1.)
                     call hf1(23000,
     +               ptheta(1)*180./3.14159,1.)
                     rke=(pmom(1)**2+0.88*16)**0.5-0.938*4
                     call hf1(1014,rke,1.)
                     call hf1(1013,rke,1.)
c                     write(*,*)eventno,run,r,momentum(1),
c     +               gridgidity(iptr),
c     +               hridgidity(1,iptr),hridgidity(2,iptr),pmass(1)
c                     write(*,*)nctccl,(ctcsignal(k),k=1,nctccl)
c                     write(*,*)pattern(iptr),betapattern(pbetap(1)),
c     +               betachi2(pbetap(1))
                     call hf1(1901,gridgidity(iptr)/hridgidity(1,iptr)
     +               ,1.)
                     call hf1(1901,gridgidity(iptr)/hridgidity(2,iptr)
     +               ,1.)
                     call hf1(1902,htheta(2,iptr)-htheta(1,iptr),1.)
                     call hf1(1903,hphi(2,iptr)-hphi(1,iptr),1.)
                     call hf1(1904,hp0(1,2,iptr)-hp0(1,1,iptr),1.)
                     call hf1(1905,hp0(2,2,iptr)-hp0(2,1,iptr),1.)
                     call hf1(1906,hp0(3,2,iptr)-hp0(3,1,iptr),1.)
                     call hf1(1907,
     +               chi2fastfit(iptr)-hchi2(1,iptr)-hchi2(2,iptr),1.)
                    call hf1(1908,r1,1.)
                    call hf1(1908,r2,1.)
                    call hf1(1961,float(pattern(iptr)),1.)
                    call hf1(1962,pmom(1),1.)
                    rke=(pmom(1)**2+0.88*16)**0.5-0.938*4
                    ig=mod(ig+1,5)
                      call hf1(1972,rke,1.)
                      call hf1(1965,charge(1),1.)
                      call hf1(1966,beta(1),1.)
                      call hf1(1967,pmass(1),1.)
                      call hf1(1968,pmass(1),1.)
                      call hf1(1969,panti,1.)
                      call hf1(1912,float(tofclusters),1.)
                      call hf1(1970,betachi2(pbetap(1)),1.)
                    do i=1,ntrclmc
                     call hf1(1702,float(itra(i)),1.)
c                     write(*,*)itra(i) 
                    enddo

                     inter=0
                     if(inter.lt.0)rate=0
                     eff=1
                    call hf1(11962,pmom(1),eff)
                    rke=(pmom(1)**2+0.88*16)**0.5-0.938*4
                    call hf1(11014,rke,eff)
                    call hf1(11013,rke,eff)
                    rke=(pmom(1)**2+0.88*16)**0.5-0.938*4
                    call hf1(11972,rke,eff)
                    call hf1(11965,pcharge(1),eff)
                    call hf1(11966,beta(1),eff)
                    call hf1(11967,pmass(1),eff)
                    call hf1(11968,pmass(1),eff)
                    call hf1(11969,panti,eff)
                    call hf1(11912,float(tofclusters),eff)
                    call hf1(11970,betachi2(pbetap(1)),eff)
                    call hf1(12000,eff,1.)
                    call hf1(12001,rate*1000.,1.)
                    call hf2(12002,rate*1000.,eff,1.)


                    

                    endif
                   endif            
                  endif
                 endif
                endif
              endif
            endif      
           endif
          endif
         endif
        endif
       endif
      endif
      endif
      anal2ap=0
*
 999  END
      function estrate(inter,phim,theta,phi)
      integer init
      real modul
           real aa(4),zz(4)
           data aa/1.,4.,12.,1./
           data zz/1.,2.,6.,1./
           double precision t,p,sth,cl

      data init/0/  
      if(init.eq.0)then
        init=1
        modul=350.
        call hbook1(7101 ,'interstellar p',1000,50.,100050.,0.)
        call hbook1(7201 ,'interstellar He',1000,50.,100050.,0.)
        call hbook1(7102 ,'modulated p',1000,50.,100050.,0.)
        call hbook1(7202 ,'modulated He',1000,50.,100050.,0.)
        call hbook1(7103 ,'modulated p',1000,50.,100050.,0.)
        call hbook1(7203 ,'modulated He',1000,50.,100050.,0.)
          call hbook1(7106,'Rate H',100,0.,5000.,0.)
          call hbook1(7206,'Rate He',100,0.,600.,0.)
          pi=3.1415926
          twopi=2*pi
          fguz=1.
          bw=100
          al=50.
          bl=100050.
          do i=1,1000
*
*  Proton
*
           xkin=(i-1)*bw+al+bw/2
           xt=xkin/1000+0.938
           beta=sqrt(1-0.938**2/xt**2)
           xmom=beta*xt
           yy=1.5e4/beta/xmom**2.74/fguz
           call hf1(7101,xkin,yy)
           xt=(xkin+modul)/1000+0.938
           beta=sqrt(1-0.938**2/xt**2)
           xmom=beta*xt
           yy=1.5e4/beta/xmom**2.74/fguz
           yy=yy*(xkin**2+2*938*xkin)/
     +     ((xkin+modul)**2+2*938*(xkin+modul))
           call hf1(7102,xkin,yy)
           call hf1(7103,xkin,yy)
*
*  He
*
           xkin=(i-1)*bw+al+bw/2
           a=4
           am=0.938*a
           amm=am*1000
           z=2
           xk=xkin*a
           xt=xk/1000+am
           beta=sqrt(1-am**2/xt**2)
           xmom=beta*xt/z
           yy=.5e4/beta/xmom**2.68/fguz
           call hf1(7201,xkin,yy)
           xkm=xk+z*modul
           xt=xkm/1000+am
           beta=sqrt(1-am**2/xt**2)
           xmom=beta*xt/z
           yy=.5e4/beta/xmom**2.68/fguz
           yy=yy*(xk**2+2*amm*xk)/
     +     (xkm**2+2*amm*xkm)
           call hf1(7202,xkin,yy)
           call hf1(7203,xkin,yy)
          enddo

      endif
             estrate=0
             thetam=78.6/180.*3.1415926
             
             do l=1,2
              xsum=hsum(7000+l*100+2)/10.
              um=sin(pi/2-thetam)*cos(phim)
              vm=sin(pi/2-thetam)*sin(phim)
              wm=cos(pi/2-thetam)
              up=sin(pi/2-theta)*cos(phi)
              vp=sin(pi/2-theta)*sin(phi)                                          
              wp=cos(pi/2-theta)
              cts=um*up+vm*vp+wm*wp
              xl=acos(cts)
              cl=abs(sin(xl))
              rate=0
              ntry=100 
              do k=1,ntry
               the=acos(rndm(d))
               phe=twopi*rndm(d)
               ue=sin(the)*cos(phe)
               ve=sin(the)*sin(phe)
               we=cos(the)
               uv=vm*wp-wm*vp
               vv=wm*up-wp*um                                                    
               wv=um*vp-vm*up
               cth=ue*uv+ve*vv+we*wv
               p=52.5*cl**4/(sqrt(1.d0-cth*cl**3)+1)**2
               pt=p
               ee=hrndm1(7000+l*100+3)/1000.
               xmom=sqrt(ee*(ee+2*0.938))*aa(l)/zz(l)
              if(xmom.gt.pt)then                                                
               rate=rate+1
              endif
             enddo
             rate=rate/ntry*xsum
             call hf1(7000+l*100+6,rate,1.)
             estrate=estrate+rate 
             enddo


      end



           subroutine decode(iaddr, ladder,half)
                integer   ladder(6),half(6)         
                vector ioffset(6),ihalf(6),icumulus(6)
                do i=1,6
                  lad=mod(iaddr/icumulus(i),2*ihalf(i)+1)
                  ladder(i)=ioffset(i)+mod(lad,ihalf(i)+1)
                  half(i)=lad/(ihalf(i)+1) 
c                  write(*,*)i,lad,ladder(i),half(i)
                enddo
            end
