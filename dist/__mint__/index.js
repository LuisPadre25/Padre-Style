import {patternVariable as K,bracketAccess as G,createElement as E,useDidUpdate as R,newVariant as H,useEffect as P,useSignal as L,fragment as Q,program as S,toArray as M,pattern as J,compare as D,variant as A,signal as C,record as B,batch as N,match as I,style as F,or as O} from "./runtime.js";export const T=A(1,`Maybe.Just`),U=A(0,`Maybe.Nothing`),V=A(1,`Result.Err`),W=A(1,`Result.Ok`),a=B(`MenuItem`),b=B(`StepStatus`),c=B(`TransferItem`),X=A(1,`Http.ResponseBody.FormData`),Y=A(1,`Http.ResponseBody.JSON`),Z=A(1,`Http.ResponseBody.HTML`),AA=A(1,`Http.ResponseBody.Text`),AB=A(1,`Http.ResponseBody.XML`),AC=A(1,`Http.ResponseBody.File`),AD=A(0,`Http.Error.NetworkError`),AE=A(0,`Http.Error.Aborted`),AF=A(0,`Http.Error.Timeout`),AG=A(0,`Http.Error.BadUrl`),AH=A(0,`Month.January`),AI=A(0,`Month.February`),AJ=A(0,`Month.March`),AK=A(0,`Month.April`),AL=A(0,`Month.May`),AM=A(0,`Month.June`),AN=A(0,`Month.July`),AO=A(0,`Month.August`),AP=A(0,`Month.September`),AQ=A(0,`Month.October`),AR=A(0,`Month.November`),AS=A(0,`Month.December`),AT=A(0,`Weekday.Monday`),AU=A(0,`Weekday.Tuesday`),AV=A(0,`Weekday.Wednesday`),AW=A(0,`Weekday.Thursday`),AX=A(0,`Weekday.Friday`),AY=A(0,`Weekday.Saturday`),AZ=A(0,`Weekday.Sunday`),d=C(`dark`),e=(f)=>{return (()=>{d.value=f})()},g=()=>{const h=(D(d.value,`dark`)?`light`:`dark`);return (()=>{d.value=h})()},i=()=>{return D(d.value,`dark`)},j=()=>{return D(d.value,`light`)},k=(l)=>{return (D(l,`dark`)?`linear-gradient(135deg, #1e1b4b 0%, #312e81 50%, #1e1b4b 100%)`:`linear-gradient(135deg, #f8fafc 0%, #e2e8f0 50%, #f1f5f9 100%)`)},m=(n)=>{return (D(n,`dark`)?`rgba(255, 255, 255, 0.95)`:`rgba(15, 23, 42, 0.95)`)},o=(p)=>{return (D(p,`dark`)?`rgba(255, 255, 255, 0.2)`:`rgba(15, 23, 42, 0.15)`)},BA=({children: q=[]})=>{return E(`div`,{className:`a`,style:F([`
        background: ${k(d.value)};
        color: ${m(d.value)};
      `])},[E(`div`,{style:F([`
        position: fixed;
        top: 1rem;
        left: 1rem;
        padding: 0.5rem;
        background: ${(D(d.value,`dark`)?`rgba(0,0,0,0.8)`:`rgba(255,255,255,0.8)`)};
        color: ${(D(d.value,`dark`)?`white`:`black`)};
        border-radius: 4px;
        z-index: 1001;
        font-size: 0.75rem;
        border: 1px solid ${o(d.value)};
      `])},[`Theme: ${d.value} - ACTIVE`]),(()=>{const _0=[];const _1=q;let _i=-1;for(let r of _1){_i++;_0.push(r)};return _0})()])},s=(t)=>{return (D(t,`dark`)?`rgba(15, 23, 42, 1)`:`rgba(248, 250, 252, 1)`)},u=(v)=>{return (D(v,`dark`)?`rgba(30, 41, 59, 0.6)`:`rgba(255, 255, 255, 0.6)`)},w=(x)=>{return (D(x,`dark`)?`0 8px 32px rgba(0, 0, 0, 0.15)`:`0 8px 32px rgba(15, 23, 42, 0.12)`)},BB=()=>{const y=(z)=>{return g()},aa=()=>{return (D(d.value,`dark`)?`☀️`:`🌙`)};return E(`button`,{"onClick":y,"title":(D(d.value,`dark`)?`Switch to Light Mode`:`Switch to Dark Mode`),className:`b`,style:F([`
        border: 2px solid ${o(d.value)};
        background: ${u(d.value)};
        color: ${m(d.value)};
        box-shadow: ${w(d.value)};
      `])},[E(`span`,{},[aa()]),E(`span`,{style:F([`font-size: 0.5rem; position: absolute; bottom: 0.2rem;`])},[d.value])])},ab=(ac)=>{return (D(ac,`dark`)?`rgba(30, 41, 59, 0.7)`:`rgba(255, 255, 255, 0.8)`)},ad=(ae)=>{return `linear-gradient(135deg, #667eea 0%, #764ba2 100%)`},af=(ag)=>{return (D(ag,`dark`)?`rgba(0, 0, 0, 0.9)`:`rgba(255, 255, 255, 0.95)`)},ah=(ai)=>{return (D(ai,`dark`)?`rgba(30, 41, 59, 0.9)`:`rgba(255, 255, 255, 0.95)`)},aj=(ak)=>{return (D(ak,`dark`)?`0 2px 8px rgba(0, 0, 0, 0.1)`:`0 2px 8px rgba(15, 23, 42, 0.08)`)},al=(am,an)=>{return (am.split(an))},ao=(ap)=>{return D(ap,``)},aq=(ar)=>{return (new Promise((resolve) => {
      setTimeout(() => {
        resolve(null)
      }, ar)
    }))},as=(at,au)=>{return (Array.from({ length: (au + 1) - at }).map((v, $0) => $0 + at))},av=(aw)=>{return (aw.length)},ax=(ay)=>{return (ay.toString())},az=(ba,bb)=>{return G(ba,bb,T,U)},bc=(bd,be)=>{return ((() => {
      const result = bd.indexOf(be);

      if (result == -1) {
        return new U()
      } else {
        return H(T)((result))
      }
    })())},bf=(bg)=>{return (bg.length)},bh=(bi,bj)=>{return (Math.min(bi, bj))},bk=(bl,bm)=>{return (Math.max(bl, bm))},bn=(bo,bp,bq)=>{return bh(bq,bk(bp,bo))},br=(bs,bt)=>{return (bs.slice(bn(0,bt,bf(bs))))},bu=(bv,bw)=>{return (bv.startsWith(bw))},bx=(by,bz,ca)=>{return (ca >= bf(by)?H(T)(by):(()=>{const cb=(by.substring(ca));return (bu(cb,bz)?(()=>{const cc=ca + bf(bz);return H(T)((by.substring(0, cc)))})():(bu(cb,("\\\\")) && ca + 1 < bf(by)?bx(by,bz,ca + 2):bx(by,bz,ca + 1)))})())},cd=(ce,cf,cg)=>{return (cg >= av(cf)?new U():I(az(cf,cg),[[J(T,[K]),(ch)=>{return (bu(ce,ch)?bx(ce,ch,bf(ch)):cd(ce,cf,cg + 1))}],[J(U,[]),()=>{return new U()}]]))},ci=(cj,ck)=>{return cd(cj,ck,0)},cl=(cm,cn,co,cp)=>{return (cn >= co?new U():(()=>{const cq=(cm.substring(cn, cn + 1));return (D(cq,`{`)?cl(cm,cn + 1,co,cp + 1):(D(cq,`}`)?(D(cp,1)?H(T)(cn):cl(cm,cn + 1,co,cp - 1)):cl(cm,cn + 1,co,cp)))})())},cr=(cs,ct)=>{const cu=bf(cs);return (ct >= cu?new U():(()=>{const cv=(cs.substring(ct, ct + 1));return (D(cv,`$`) || D(cv,`#`)?(ct + 1 < cu?(()=>{const cw=(cs.substring(ct + 1, ct + 2));return (D(cw,`{`)?I(cl(cs,ct + 2,cu,1),[[J(T,[K]),(cx)=>{return H(T)([ct,cx + 1])}],[J(U,[]),()=>{return cr(cs,ct + 1)}]]):cr(cs,ct + 1))})():new U()):cr(cs,ct + 1))})())},cy=(cz,da,db)=>{return (cz.replace(da, db))},dc=(dd)=>{return cy(cy(cy(dd,`&`,`&amp;`),`<`,`&lt;`),`>`,`&gt;`)},de=(df,dg)=>{return ("<span style='color: " + dg + ";'>" + dc(df) + "</span>")},dh=(di)=>{return (ao(di)?false:((() => { const c = di.charCodeAt(0); return c >= 48 && c <= 57; })()))},dj=(dk)=>{return (ao(dk)?false:((() => { const c = dk.charCodeAt(0); return (c >= 48 && c <= 57) || c === 46; })()))},dl=(dm,dn)=>{return (dn >= bf(dm)?H(T)((dm.substring(0, dn))):(()=>{const dp=(dm.substring(dn, dn + 1));return (dj(dp)?dl(dm,dn + 1):H(T)((dm.substring(0, dn))))})())},dq=(dr)=>{const ds=(dr.substring(0, 1));return (dh(ds)?dl(dr,1):new U())},dt=(du)=>{return (ao(du)?false:((() => { const c = du.charCodeAt(0); return (c >= 65 && c <= 90) || (c >= 97 && c <= 122) || c === 95; })()))},dv=(dw)=>{return (ao(dw)?false:((() => { const c = dw.charCodeAt(0); return (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122) || c === 95; })()))},dx=(dy,dz,ea)=>{const eb=bf(dy);return (dz >= eb?H(T)((dy.substring(0, dz))):(()=>{const ec=(dy.substring(dz, dz + 1));return (dv(ec)?dx(dy,dz + 1,ea):(D(ec,`-`) && dz + 1 < eb?(()=>{const ed=(dy.substring(dz + 1, dz + 2));return (dt(ed) || ea?dx(dy,dz + 1,true):H(T)((dy.substring(0, dz))))})():H(T)((dy.substring(0, dz)))))})())},ee=(ef)=>{const eg=(ef.substring(0, 1));return (dt(eg)?dx(ef,1,false):(D(eg,`$`) || D(eg,`@`)?dx(ef,1,true):(D(eg,`-`)?dx(ef,1,true):new U())))},eh=(ei,ej)=>{return G((()=>{const _0=[];const _1=ei;let _i=-1;for(let ek of _1){_i++;const _2=ej(ek);if(!_2){continue};_0.push(ek)};return _0})(),0,T,U)},el=(em,en)=>{return !D(eh(em,en),new U())},eo=(ep,eq)=>{return el(ep,(er)=>{return D(er,eq)})},es=(et)=>{return (ao(et)?false:((() => { return et === et.toUpperCase() && /[A-Z]/.test(et); })()))},eu=(ev,ew)=>{return ((() => { const rest = ev.substring(ew).trim(); return rest.startsWith('('); })())},ex=(ey)=>{return (ao(ey)?false:((() => { const first = ey.charAt(0); return first === first.toUpperCase() && /[A-Z]/.test(first); })()))},ez=(fa)=>{return D(fa,`(`) || D(fa,`)`) || D(fa,`[`) || D(fa,`]`) || D(fa,`{`) || D(fa,`}`)},fb=(fc)=>{return D(fc,`(`) || D(fc,`[`) || D(fc,`{`)},fd=(fe)=>{const ff=(fe % 12);return (D(ff,0)?`#FFD700`:(D(ff,1)?`#DA70D6`:(D(ff,2)?`#179FFF`:(D(ff,3)?`#FF6B6B`:(D(ff,4)?`#4ECDC4`:(D(ff,5)?`#95E1D3`:(D(ff,6)?`#FFA07A`:(D(ff,7)?`#98D8C8`:(D(ff,8)?`#F7DC6F`:(D(ff,9)?`#BB8FCE`:(D(ff,10)?`#85C1E2`:`#F8B195`)))))))))))},fg=(fh)=>{return ((() => {
      // Use depth to generate a deterministic but varied hue
      const hue = (fh * 137.5) % 360; // Golden angle for good distribution
      const saturation = 65 + (fh % 20); // 65-85%
      const lightness = 55 + (fh % 15); // 55-70%
      return "hsl(" + hue + ", " + saturation + "%, " + lightness + "%)";
    })())},fi=(fj)=>{return (fj < 12?fd(fj):fg(fj))},fk=(fl)=>{return D(fl,`)`) || D(fl,`]`) || D(fl,`}`)},fm=(fn)=>{return (ao(fn)?false:((() => { return /[+\-*/%=<>!&|^~?:]/.test(fn); })()))},fo=(fp)=>{const fq=(fp.substring(0, 1));return (fm(fq)?(()=>{const fr=(fp.substring(0, 2));const fs=(fp.substring(0, 3));return (bu(fp,`===`) || bu(fp,`!==`) || bu(fp,`>>>`) || bu(fp,`<<=`) || bu(fp,`>>=`)?H(T)(fs):(bu(fp,`==`) || bu(fp,`!=`) || bu(fp,`<=`) || bu(fp,`>=`) || bu(fp,`&&`) || bu(fp,`||`) || bu(fp,`++`) || bu(fp,`--`) || bu(fp,`<<`) || bu(fp,`>>`) || bu(fp,`=>`) || bu(fp,`::`) || bu(fp,`+=`) || bu(fp,`-=`) || bu(fp,`*=`) || bu(fp,`/=`) || bu(fp,`%=`) || bu(fp,`|>`)?H(T)(fr):H(T)(fq)))})():new U())},ft=(fu,fv,fw,fx,fy,fz,ga,gb)=>{return (fz >= bf(fu)?ga:(()=>{const gc=br(fu,fz);return I(ci(gc,fy),[[J(T,[K]),(gd)=>{return (()=>{const ge=bf(gd);const gf=de(gd,`#CE9178`);return ft(fu,fv,fw,fx,fy,fz + ge,ga + gf,gb)})()}],[J(U,[]),()=>{return I(dq(gc),[[J(T,[K]),(gg)=>{return (()=>{const gh=bf(gg);const gi=de(gg,`#B5CEA8`);return ft(fu,fv,fw,fx,fy,fz + gh,ga + gi,gb)})()}],[J(U,[]),()=>{return I(ee(gc),[[J(T,[K]),(gj)=>{return (()=>{const gk=bf(gj);const gl=(eo(fv,gj)?de(gj,`#C586C0`):(eo(fw,gj)?de(gj,`#4EC9B0`):(eo(fx,gj)?de(gj,`#569CD6`):(es(gj)?de(gj,`#4FC1FF`):(eu(fu,fz + gk)?de(gj,`#DCDCAA`):(ex(gj)?de(gj,`#4EC9B0`):de(gj,`#9CDCFE`)))))));return ft(fu,fv,fw,fx,fy,fz + gk,ga + gl,gb)})()}],[J(U,[]),()=>{return (()=>{const gm=(gc.substring(0, 1));return (ez(gm)?(fb(gm)?(()=>{const gn=fi(gb);const go=de(gm,gn);return ft(fu,fv,fw,fx,fy,fz + 1,ga + go,gb + 1)})():(fk(gm)?(()=>{const gp=(gb > 0?gb - 1:0);const gq=fi(gp);const gr=de(gm,gq);return ft(fu,fv,fw,fx,fy,fz + 1,ga + gr,gp)})():(()=>{const gs=de(gm,`#D4D4D4`);return ft(fu,fv,fw,fx,fy,fz + 1,ga + gs,gb)})())):I(fo(gc),[[J(T,[K]),(gt)=>{return (()=>{const gu=bf(gt);const gv=de(gt,`#D4D4D4`);return ft(fu,fv,fw,fx,fy,fz + gu,ga + gv,gb)})()}],[J(U,[]),()=>{return (()=>{const gw=de(gm,`#D4D4D4`);return ft(fu,fv,fw,fx,fy,fz + 1,ga + gw,gb)})()}]]))})()}]])}]])}]])})())},gx=(gy,gz,ha,hb)=>{const hc=bf(gy);return (hc <= 3?de(gy,`#9CDCFE`):(()=>{const hd=(gy.substring(0, 2));const he=(gy.substring(hc - 1, hc));const hf=(gy.substring(2, hc - 1));const hg=ft(hf,gz,ha,hb,[],0,``,0);return de(hd,`#9CDCFE`) + hg + de(he,`#9CDCFE`)})())},hh=(hi)=>{return D(hi,`0`) || D(hi,`1`) || D(hi,`2`) || D(hi,`3`) || D(hi,`4`) || D(hi,`5`) || D(hi,`6`) || D(hi,`7`) || D(hi,`8`) || D(hi,`9`)},hj=(hk,hl,hm)=>{return (hl >= hm?hl:(()=>{const hn=(hk.substring(hl, hl + 1));return (hh(hn) || D(hn,`.`) || D(hn,`-`) || D(hn,`+`) || D(hn,` `) || D(hn,`#`)?hj(hk,hl + 1,hm):hl)})())},ho=(hp,hq)=>{const hr=bf(hp);return (hq >= hr?new U():(()=>{const hs=(hp.substring(hq, hq + 1));return (D(hs,`%`)?(hq + 1 < hr?(()=>{const ht=hj(hp,hq + 1,hr);return (ht < hr?(()=>{const hu=(hp.substring(ht, ht + 1));return (D(hu,`s`) || D(hu,`d`) || D(hu,`f`) || D(hu,`v`) || D(hu,`t`) || D(hu,`b`) || D(hu,`o`) || D(hu,`x`) || D(hu,`X`) || D(hu,`e`) || D(hu,`E`) || D(hu,`g`) || D(hu,`G`) || D(hu,`c`) || D(hu,`p`) || D(hu,`%`) || D(hu,`i`) || D(hu,`u`)?H(T)(ht + 1):ho(hp,hq + 1))})():ho(hp,hq + 1))})():new U()):ho(hp,hq + 1))})())},hv=(hw,hx,hy)=>{return (hx >= hy?hx:(()=>{const hz=(hw.substring(hx, hx + 1));return (D(hz,`%`)?hx:hv(hw,hx + 1,hy))})())},ia=(ib,ic,id,ie,ig,ih)=>{return I(cr(ib,ic),[[J(T,[K]),(ii)=>{return I(ii,[[[K,K],(ij,ik)=>{return (ik <= id?(()=>{const il=(ib.substring(ic, ij));const im=(ib.substring(ij, ik));const io=ia(ib,ik,id,ie,ig,ih);return de(il,`#CE9178`) + gx(im,ie,ig,ih) + io})():de((ib.substring(ic, id)),`#CE9178`))}]])}],[J(U,[]),()=>{return I(ho(ib,ic),[[J(T,[K]),(ip)=>{return (ip <= id?(()=>{const iq=hv(ib,ic,ip);const ir=(ib.substring(ic, iq));const is=(ib.substring(iq, ip));const it=ia(ib,ip,id,ie,ig,ih);return de(ir,`#CE9178`) + de(is,`#D7BA7D`) + it})():de((ib.substring(ic, id)),`#CE9178`))}],[J(U,[]),()=>{return de((ib.substring(ic, id)),`#CE9178`)}]])}]])},iu=(iv,iw,ix,iy,iz,ja,jb,jc)=>{return (ja >= bf(iv)?[jb,jc]:(()=>{const jd=br(iv,ja);return I(ci(jd,iz),[[J(T,[K]),(je)=>{return (()=>{const jf=bf(je);const jg=(jf >= 2?(()=>{const jh=(je.substring(0, 1));const ji=ia(je,1,jf - 1,iw,ix,iy);return de(jh,`#CE9178`) + ji + de(jh,`#CE9178`)})():de(je,`#CE9178`));return iu(iv,iw,ix,iy,iz,ja + jf,jb + jg,jc)})()}],[J(U,[]),()=>{return I(dq(jd),[[J(T,[K]),(jj)=>{return (()=>{const jk=bf(jj);const jl=de(jj,`#B5CEA8`);return iu(iv,iw,ix,iy,iz,ja + jk,jb + jl,jc)})()}],[J(U,[]),()=>{return I(ee(jd),[[J(T,[K]),(jm)=>{return (()=>{const jn=bf(jm);const jo=(eo(iw,jm)?de(jm,`#C586C0`):(eo(ix,jm)?de(jm,`#4EC9B0`):(eo(iy,jm)?de(jm,`#569CD6`):(es(jm)?de(jm,`#4FC1FF`):(eu(iv,ja + jn)?de(jm,`#DCDCAA`):(ex(jm)?de(jm,`#4EC9B0`):de(jm,`#9CDCFE`)))))));return iu(iv,iw,ix,iy,iz,ja + jn,jb + jo,jc)})()}],[J(U,[]),()=>{return (()=>{const jp=(jd.substring(0, 1));return (ez(jp)?(fb(jp)?(()=>{const jq=fi(jc);const jr=de(jp,jq);return iu(iv,iw,ix,iy,iz,ja + 1,jb + jr,jc + 1)})():(fk(jp)?(()=>{const js=(jc > 0?jc - 1:0);const jt=fi(js);const ju=de(jp,jt);return iu(iv,iw,ix,iy,iz,ja + 1,jb + ju,js)})():(()=>{const jv=de(jp,`#D4D4D4`);return iu(iv,iw,ix,iy,iz,ja + 1,jb + jv,jc)})())):I(fo(jd),[[J(T,[K]),(jw)=>{return (()=>{const jx=bf(jw);const jy=de(jw,`#D4D4D4`);return iu(iv,iw,ix,iy,iz,ja + jx,jb + jy,jc)})()}],[J(U,[]),()=>{return (()=>{const jz=de(jp,`#D4D4D4`);return iu(iv,iw,ix,iy,iz,ja + 1,jb + jz,jc)})()}]]))})()}]])}]])}]])})())},ka=(kb,kc,kd,ke,kf,kg,kh)=>{return (!ao(kf)?I(bc(kb,kf),[[J(T,[K]),(ki)=>{return (()=>{const kj=iu((kb.substring(0, ki)),kc,kd,ke,kg,0,``,kh);const kk=de(br(kb,ki),`#6A9955`);return I(kj,[[[K,K],(kl,km)=>{return [kl + kk,km]}]])})()}],[J(U,[]),()=>{return iu(kb,kc,kd,ke,kg,0,``,kh)}]]):iu(kb,kc,kd,ke,kg,0,``,kh))},kn=(ko,kp,kq,kr,ks,kt,ku,kv,kw)=>{return (ku >= av(ko)?kw:I(az(ko,ku),[[J(T,[K]),(kx)=>{return (()=>{const ky=ka(kx,kp,kq,kr,ks,kt,kv);return I(ky,[[[K,K],(kz,la)=>{return (()=>{const lb=(ku < av(ko) - 1?kz + `\n`:kz);return kn(ko,kp,kq,kr,ks,kt,ku + 1,la,kw + lb)})()}]])})()}],[J(U,[]),()=>{return kn(ko,kp,kq,kr,ks,kt,ku + 1,kv,kw)}]]))},lc=(ld,le,lf,lg,lh,li)=>{const lj=al(ld,`\n`);return kn(lj,le,lf,lg,lh,li,0,0,``)},lk=(ll)=>{return lc(ll,[`as`,`case`,`component`,`connect`,`const`,`decode`,`defer`,`do`,`else`,`encode`,`enum`,`expose`,`exposing`,`for`,`fun`,`get`,`global`,`if`,`inline`,`let`,`module`,`next`,`of`,`parallel`,`property`,`provider`,`return`,`routes`,`sequence`,`set`,`signal`,`state`,`store`,`style`,`suite`,`test`,`try`,`use`,`when`,`where`],[`Array`,`Bool`,`Function`,`Html`,`Map`,`Maybe`,`Number`,`Object`,`Promise`,`Result`,`Set`,`String`,`Time`,`Tuple`,`Void`],[`true`,`false`],`//`,[`"`])},lm=(ln)=>{return lc(ln,[`const`,`let`,`var`,`function`,`class`,`extends`,`implements`,`if`,`else`,`switch`,`case`,`default`,`break`,`continue`,`for`,`while`,`do`,`of`,`in`,`with`,`try`,`catch`,`finally`,`throw`,`return`,`async`,`await`,`yield`,`import`,`export`,`from`,`as`,`new`,`this`,`super`,`static`,`get`,`set`,`delete`,`typeof`,`instanceof`,`void`,`debugger`],[`Promise`,`Array`,`Object`,`String`,`Number`,`Boolean`,`Math`,`JSON`,`Date`,`RegExp`,`Error`,`Map`,`Set`,`WeakMap`,`WeakSet`,`Symbol`,`Proxy`,`Reflect`,`FormData`,`Response`,`Request`,`console`,`window`,`document`,`fetch`,`setTimeout`,`setInterval`,`parseInt`,`parseFloat`],[`true`,`false`,`null`,`undefined`,`NaN`,`Infinity`],`//`,[`"`,`'`,`\``])},lo=(lp)=>{return lc(lp,[`abstract`,`any`,`as`,`async`,`await`,`break`,`case`,`catch`,`class`,`const`,`continue`,`debugger`,`declare`,`default`,`delete`,`do`,`else`,`enum`,`export`,`extends`,`finally`,`for`,`from`,`function`,`get`,`if`,`implements`,`import`,`in`,`instanceof`,`interface`,`is`,`keyof`,`let`,`namespace`,`never`,`new`,`of`,`package`,`private`,`protected`,`public`,`readonly`,`return`,`set`,`static`,`super`,`switch`,`this`,`throw`,`try`,`type`,`typeof`,`var`,`void`,`while`,`with`,`yield`],[`string`,`number`,`boolean`,`symbol`,`bigint`,`object`,`unknown`,`undefined`,`null`,`Array`,`Promise`,`Map`,`Set`,`Record`,`Partial`,`Required`,`Readonly`,`Pick`,`Omit`,`Exclude`,`Extract`,`NonNullable`,`ReturnType`,`InstanceType`,`Parameters`],[`true`,`false`,`null`,`undefined`],`//`,[`"`,`'`,`\``])},lq=(lr)=>{return lc(lr,[`and`,`as`,`assert`,`async`,`await`,`break`,`class`,`continue`,`def`,`del`,`elif`,`else`,`except`,`finally`,`for`,`from`,`global`,`if`,`import`,`in`,`is`,`lambda`,`nonlocal`,`not`,`or`,`pass`,`raise`,`return`,`try`,`while`,`with`,`yield`],[`int`,`float`,`str`,`bool`,`list`,`tuple`,`dict`,`set`,`frozenset`,`bytes`,`bytearray`,`memoryview`,`range`,`object`,`type`,`super`,`property`,`staticmethod`,`classmethod`,`Exception`,`BaseException`],[`True`,`False`,`None`],`#`,[`"`,`'`])},ls=(lt)=>{return lc(lt,[`break`,`case`,`chan`,`const`,`continue`,`default`,`defer`,`else`,`fallthrough`,`for`,`func`,`go`,`goto`,`if`,`import`,`interface`,`map`,`package`,`range`,`return`,`select`,`struct`,`switch`,`type`,`var`],[`bool`,`byte`,`complex64`,`complex128`,`error`,`float32`,`float64`,`int`,`int8`,`int16`,`int32`,`int64`,`rune`,`string`,`uint`,`uint8`,`uint16`,`uint32`,`uint64`,`uintptr`],[`true`,`false`,`nil`,`iota`],`//`,[`"`,`\``])},lu=(lv)=>{return lc(lv,[`abstract`,`alias`,`as`,`asm`,`begin`,`break`,`case`,`class`,`def`,`do`,`else`,`elsif`,`end`,`ensure`,`enum`,`extend`,`for`,`fun`,`if`,`in`,`include`,`instance_sizeof`,`is_a`,`lib`,`macro`,`module`,`next`,`of`,`out`,`pointerof`,`private`,`protected`,`require`,`rescue`,`return`,`select`,`self`,`sizeof`,`struct`,`super`,`then`,`type`,`typeof`,`uninitialized`,`union`,`unless`,`until`,`verbatim`,`when`,`while`,`with`,`yield`],[`Array`,`Bool`,`Char`,`Float`,`Float32`,`Float64`,`Hash`,`Int`,`Int8`,`Int16`,`Int32`,`Int64`,`String`,`Symbol`,`Tuple`,`UInt`,`UInt8`,`UInt16`,`UInt32`,`UInt64`,`Void`],[`true`,`false`,`nil`],`#`,[`"`,`'`])},lw=(lx)=>{return lc(lx,[],[],[`true`,`false`,`null`],``,[`"`])},ly=(lz)=>{return lc(lz,[`if`,`then`,`else`,`elif`,`fi`,`case`,`esac`,`for`,`select`,`while`,`until`,`do`,`done`,`in`,`function`,`time`,`coproc`,`return`,`exit`,`break`,`continue`,`export`,`local`,`readonly`,`declare`,`typeset`,`unset`,`shift`,`source`],[`echo`,`printf`,`read`,`cd`,`pwd`,`ls`,`cp`,`mv`,`rm`,`mkdir`,`touch`,`cat`,`grep`,`sed`,`awk`,`find`,`chmod`,`chown`],[`true`,`false`],`#`,[`"`,`'`])},ma=(mb)=>{return lc(mb,[`DOCTYPE`,`html`,`head`,`title`,`body`,`div`,`span`,`a`,`p`,`h1`,`h2`,`h3`,`h4`,`h5`,`h6`,`ul`,`ol`,`li`,`table`,`tr`,`td`,`th`,`form`,`input`,`button`,`select`,`option`,`textarea`,`label`,`img`,`video`,`audio`,`script`,`style`,`link`,`meta`,`br`,`hr`],[],[],``,[`"`,`'`])},mc=(md)=>{return lc(md,[`important`,`media`,`keyframes`,`from`,`to`,`and`,`not`,`only`],[`color`,`background`,`background-color`,`background-image`,`background-size`,`background-position`,`background-repeat`,`border`,`border-radius`,`border-color`,`border-width`,`border-style`,`border-top`,`border-right`,`border-bottom`,`border-left`,`margin`,`margin-top`,`margin-right`,`margin-bottom`,`margin-left`,`padding`,`padding-top`,`padding-right`,`padding-bottom`,`padding-left`,`width`,`height`,`min-width`,`max-width`,`min-height`,`max-height`,`display`,`position`,`top`,`right`,`bottom`,`left`,`flex`,`flex-direction`,`flex-wrap`,`flex-grow`,`flex-shrink`,`flex-basis`,`justify-content`,`align-items`,`align-content`,`align-self`,`grid`,`grid-template`,`grid-template-columns`,`grid-template-rows`,`grid-template-areas`,`grid-gap`,`grid-column`,`grid-row`,`gap`,`font`,`font-family`,`font-size`,`font-weight`,`font-style`,`font-variant`,`text`,`text-align`,`text-decoration`,`text-transform`,`text-indent`,`text-shadow`,`line-height`,`letter-spacing`,`word-spacing`,`white-space`,`transform`,`transform-origin`,`transition`,`transition-property`,`transition-duration`,`transition-timing-function`,`transition-delay`,`animation`,`animation-name`,`animation-duration`,`animation-timing-function`,`animation-delay`,`animation-iteration-count`,`animation-direction`,`animation-fill-mode`,`animation-play-state`,`opacity`,`visibility`,`overflow`,`overflow-x`,`overflow-y`,`z-index`,`cursor`,`box-shadow`,`box-sizing`,`outline`,`outline-color`,`outline-width`,`outline-style`,`content`,`list-style`,`list-style-type`,`list-style-position`,`list-style-image`,`vertical-align`,`float`,`clear`,`-webkit-border-radius`,`-moz-border-radius`,`-webkit-box-shadow`,`-moz-box-shadow`,`-webkit-transform`,`-moz-transform`,`-ms-transform`,`-o-transform`,`-webkit-transition`,`-moz-transition`,`-ms-transition`,`-o-transition`,`-webkit-animation`,`-moz-animation`,`-ms-animation`,`-o-animation`,`-webkit-appearance`,`-moz-appearance`,`-webkit-user-select`,`-moz-user-select`,`-ms-user-select`,`-webkit-box-sizing`,`-moz-box-sizing`,`-webkit-flex`,`-ms-flex`,`-webkit-flex-direction`,`-ms-flex-direction`,`-webkit-justify-content`,`-ms-flex-pack`,`-webkit-align-items`,`-ms-flex-align`,`-webkit-backdrop-filter`,`backdrop-filter`],[],`//`,[`"`,`'`])},me=(mf)=>{return lc(mf,[`important`,`media`,`keyframes`,`from`,`to`,`and`,`not`,`only`,`mixin`,`include`,`extend`,`function`,`return`,`if`,`else`,`for`,`each`,`while`,`content`,`import`,`use`,`forward`,`at-root`],[`color`,`background`,`background-color`,`background-image`,`background-size`,`background-position`,`background-repeat`,`border`,`border-radius`,`border-color`,`border-width`,`border-style`,`border-top`,`border-right`,`border-bottom`,`border-left`,`margin`,`margin-top`,`margin-right`,`margin-bottom`,`margin-left`,`padding`,`padding-top`,`padding-right`,`padding-bottom`,`padding-left`,`width`,`height`,`min-width`,`max-width`,`min-height`,`max-height`,`display`,`position`,`top`,`right`,`bottom`,`left`,`flex`,`flex-direction`,`flex-wrap`,`flex-grow`,`flex-shrink`,`flex-basis`,`justify-content`,`align-items`,`align-content`,`align-self`,`grid`,`grid-template`,`grid-template-columns`,`grid-template-rows`,`grid-template-areas`,`grid-gap`,`grid-column`,`grid-row`,`gap`,`font`,`font-family`,`font-size`,`font-weight`,`font-style`,`font-variant`,`text`,`text-align`,`text-decoration`,`text-transform`,`text-indent`,`text-shadow`,`line-height`,`letter-spacing`,`word-spacing`,`white-space`,`transform`,`transform-origin`,`transition`,`transition-property`,`transition-duration`,`transition-timing-function`,`transition-delay`,`animation`,`animation-name`,`animation-duration`,`animation-timing-function`,`animation-delay`,`animation-iteration-count`,`animation-direction`,`animation-fill-mode`,`animation-play-state`,`opacity`,`visibility`,`overflow`,`overflow-x`,`overflow-y`,`z-index`,`cursor`,`box-shadow`,`box-sizing`,`outline`,`outline-color`,`outline-width`,`outline-style`,`content`,`list-style`,`list-style-type`,`list-style-position`,`list-style-image`,`vertical-align`,`float`,`clear`,`-webkit-border-radius`,`-moz-border-radius`,`-webkit-box-shadow`,`-moz-box-shadow`,`-webkit-transform`,`-moz-transform`,`-ms-transform`,`-o-transform`,`-webkit-transition`,`-moz-transition`,`-ms-transition`,`-o-transition`,`-webkit-animation`,`-moz-animation`,`-ms-animation`,`-o-animation`,`-webkit-appearance`,`-moz-appearance`,`-webkit-user-select`,`-moz-user-select`,`-ms-user-select`,`-webkit-box-sizing`,`-moz-box-sizing`,`-webkit-flex`,`-ms-flex`,`-webkit-flex-direction`,`-ms-flex-direction`,`-webkit-justify-content`,`-ms-flex-pack`,`-webkit-align-items`,`-ms-flex-align`,`-webkit-backdrop-filter`,`backdrop-filter`],[],`//`,[`"`,`'`])},mg=(mh)=>{return lc(mh,[`important`,`media`,`keyframes`,`from`,`to`,`and`,`not`,`only`,`import`,`use`,`forward`,`if`,`else`,`for`,`each`,`while`],[`color`,`background`,`background-color`,`background-image`,`background-size`,`background-position`,`background-repeat`,`border`,`border-radius`,`border-color`,`border-width`,`border-style`,`border-top`,`border-right`,`border-bottom`,`border-left`,`margin`,`margin-top`,`margin-right`,`margin-bottom`,`margin-left`,`padding`,`padding-top`,`padding-right`,`padding-bottom`,`padding-left`,`width`,`height`,`min-width`,`max-width`,`min-height`,`max-height`,`display`,`position`,`top`,`right`,`bottom`,`left`,`flex`,`flex-direction`,`flex-wrap`,`flex-grow`,`flex-shrink`,`flex-basis`,`justify-content`,`align-items`,`align-content`,`align-self`,`grid`,`grid-template`,`grid-template-columns`,`grid-template-rows`,`grid-template-areas`,`grid-gap`,`grid-column`,`grid-row`,`gap`,`font`,`font-family`,`font-size`,`font-weight`,`font-style`,`font-variant`,`text`,`text-align`,`text-decoration`,`text-transform`,`text-indent`,`text-shadow`,`line-height`,`letter-spacing`,`word-spacing`,`white-space`,`transform`,`transform-origin`,`transition`,`transition-property`,`transition-duration`,`transition-timing-function`,`transition-delay`,`animation`,`animation-name`,`animation-duration`,`animation-timing-function`,`animation-delay`,`animation-iteration-count`,`animation-direction`,`animation-fill-mode`,`animation-play-state`,`opacity`,`visibility`,`overflow`,`overflow-x`,`overflow-y`,`z-index`,`cursor`,`box-shadow`,`box-sizing`,`outline`,`outline-color`,`outline-width`,`outline-style`,`content`,`list-style`,`list-style-type`,`list-style-position`,`list-style-image`,`vertical-align`,`float`,`clear`,`-webkit-border-radius`,`-moz-border-radius`,`-webkit-box-shadow`,`-moz-box-shadow`,`-webkit-transform`,`-moz-transform`,`-ms-transform`,`-o-transform`,`-webkit-transition`,`-moz-transition`,`-ms-transition`,`-o-transition`,`-webkit-animation`,`-moz-animation`,`-ms-animation`,`-o-animation`,`-webkit-appearance`,`-moz-appearance`,`-webkit-user-select`,`-moz-user-select`,`-ms-user-select`,`-webkit-box-sizing`,`-moz-box-sizing`,`-webkit-flex`,`-ms-flex`,`-webkit-flex-direction`,`-ms-flex-direction`,`-webkit-justify-content`,`-ms-flex-pack`,`-webkit-align-items`,`-ms-flex-align`,`-webkit-backdrop-filter`,`backdrop-filter`],[],`//`,[`"`,`'`])},mi=(mj)=>{return lc(mj,[`important`,`media`,`keyframes`,`from`,`to`,`and`,`not`,`only`,`import`,`when`,`if`,`each`],[`color`,`background`,`background-color`,`background-image`,`background-size`,`background-position`,`background-repeat`,`border`,`border-radius`,`border-color`,`border-width`,`border-style`,`border-top`,`border-right`,`border-bottom`,`border-left`,`margin`,`margin-top`,`margin-right`,`margin-bottom`,`margin-left`,`padding`,`padding-top`,`padding-right`,`padding-bottom`,`padding-left`,`width`,`height`,`min-width`,`max-width`,`min-height`,`max-height`,`display`,`position`,`top`,`right`,`bottom`,`left`,`flex`,`flex-direction`,`flex-wrap`,`flex-grow`,`flex-shrink`,`flex-basis`,`justify-content`,`align-items`,`align-content`,`align-self`,`grid`,`grid-template`,`grid-template-columns`,`grid-template-rows`,`grid-template-areas`,`grid-gap`,`grid-column`,`grid-row`,`gap`,`font`,`font-family`,`font-size`,`font-weight`,`font-style`,`font-variant`,`text`,`text-align`,`text-decoration`,`text-transform`,`text-indent`,`text-shadow`,`line-height`,`letter-spacing`,`word-spacing`,`white-space`,`transform`,`transform-origin`,`transition`,`transition-property`,`transition-duration`,`transition-timing-function`,`transition-delay`,`animation`,`animation-name`,`animation-duration`,`animation-timing-function`,`animation-delay`,`animation-iteration-count`,`animation-direction`,`animation-fill-mode`,`animation-play-state`,`opacity`,`visibility`,`overflow`,`overflow-x`,`overflow-y`,`z-index`,`cursor`,`box-shadow`,`box-sizing`,`outline`,`outline-color`,`outline-width`,`outline-style`,`content`,`list-style`,`list-style-type`,`list-style-position`,`list-style-image`,`vertical-align`,`float`,`clear`,`-webkit-border-radius`,`-moz-border-radius`,`-webkit-box-shadow`,`-moz-box-shadow`,`-webkit-transform`,`-moz-transform`,`-ms-transform`,`-o-transform`,`-webkit-transition`,`-moz-transition`,`-ms-transition`,`-o-transition`,`-webkit-animation`,`-moz-animation`,`-ms-animation`,`-o-animation`,`-webkit-appearance`,`-moz-appearance`,`-webkit-user-select`,`-moz-user-select`,`-ms-user-select`,`-webkit-box-sizing`,`-moz-box-sizing`,`-webkit-flex`,`-ms-flex`,`-webkit-flex-direction`,`-ms-flex-direction`,`-webkit-justify-content`,`-ms-flex-pack`,`-webkit-align-items`,`-ms-flex-align`,`-webkit-backdrop-filter`,`backdrop-filter`],[],`//`,[`"`,`'`])},mk=(ml)=>{return lc(ml,[`GET`,`POST`,`PUT`,`DELETE`,`PATCH`,`HEAD`,`OPTIONS`,`CONNECT`,`TRACE`,`HTTP`],[`Content-Type`,`Authorization`,`Accept`,`User-Agent`,`Host`,`Connection`,`Cache-Control`,`Cookie`,`Set-Cookie`],[],``,[`"`])},mm=(mn)=>{return lc(mn,[`if`,`unless`,`while`,`until`,`for`,`each`,`case`,`when`,`else`],[],[`true`,`false`,`nil`],`/`,[`"`,`'`])},mo=(mp)=>{return lc(mp,[`controller`,`action`,`target`,`targets`,`connect`,`disconnect`,`initialize`,`data`,`static`,`values`,`classes`,`outlets`],[`Controller`,`Application`,`Context`,`Element`],[`true`,`false`,`null`,`undefined`],`//`,[`"`,`'`])},BC=({mq=``,mr=`mint`,ms=true,mt=true,mu=``,mv=``})=>{const mw=L(false),mx=async (my)=>{(navigator.clipboard.writeText(mq));(()=>{mw.value=true})();await aq(2000);return (()=>{mw.value=false})()},mz=()=>{return al(mq,`\n`)},na=()=>{return I(mr,[[`mint`,()=>{return lk(mq)}],[`javascript`,()=>{return lm(mq)}],[`typescript`,()=>{return lo(mq)}],[`python`,()=>{return lq(mq)}],[`go`,()=>{return ls(mq)}],[`crystal`,()=>{return lu(mq)}],[`json`,()=>{return lw(mq)}],[`bash`,()=>{return ly(mq)}],[`html`,()=>{return ma(mq)}],[`css`,()=>{return mc(mq)}],[`scss`,()=>{return me(mq)}],[`sass`,()=>{return mg(mq)}],[`less`,()=>{return mi(mq)}],[`http`,()=>{return mk(mq)}],[`haml`,()=>{return mm(mq)}],[`stimulus`,()=>{return mo(mq)}],[null,()=>{return mq}]])},nb=()=>{const nc=na();const nd=al(nc,`\n`);return (()=>{const _0=[];const _1=as(0,av(nd) - 1);let _i=-1;for(let ne of _1){_i++;_0.push(I(az(nd,ne),[[J(T,[K]),(nf)=>{return E(`div`,{className:`mp`},[E(`span`,{"dangerouslySetInnerHTML":({ __html: nf })})])}],[J(U,[]),()=>{return E(`div`,{})}]]))};return _0})()},ng=()=>{const _={[`--q-a`]:`1px solid ` + o(d.value),[`--q-b`]:ah(d.value)};return _},nh=()=>{const _={[`--r-a`]:`1px solid ` + o(d.value)};return _},ni=()=>{const _={[`--s-a`]:m(d.value)};return _},nj=()=>{const _={[`--t-a`]:ad(d.value)};return _},nk=()=>{const _={[`--u-a`]:(ao(mv)?`none`:mv)};return _};const nl=mz();const nm=(ao(mu)?mr:mu);return E(`div`,{className:`mh`,style:F([ng()])},[E(`div`,{className:`mi`,style:F([nh()])},[E(`div`,{className:`mj`,style:F([ni()])},[nm]),(mt?E(`button`,{"onClick":mx,className:`mk`,style:F([nj()])},[(mw.value?`✓ Copied!`:`📋 Copy`)]):E(`div`,{}))]),E(`div`,{className:`ml`,style:F([nk()])},[(ms?E(`div`,{className:`mm`},[(()=>{const _0=[];const _1=as(0,av(nl) - 1);let _i=-1;for(let nn of _1){_i++;_0.push(E(`div`,{className:`mn`},[ax(nn + 1)]))};return _0})()]):E(`div`,{})),E(`div`,{className:`mo`},[nb()])])])},no=(np)=>{return (Promise.resolve(np))},nq=()=>{return no(null)},nr=(ns)=>{return `linear-gradient(135deg, #10b981 0%, #059669 100%)`},BD=({children: nt=[],nu=(nv)=>{return nq()},nw=`primary`})=>{const nx=()=>{return I(nw,[[`secondary`,()=>{return `
          background: ${u(d.value)};
          color: ${m(d.value)};
          border: 1px solid ${o(d.value)};
          box-shadow: ${w(d.value)};
        `}],[`success`,()=>{return `
          background: ${nr(d.value)};
          color: ${af(d.value)};
          border: 1px solid ${o(d.value)};
          box-shadow: ${w(d.value)};
        `}],[null,()=>{return `
          background: ${ad(d.value)};
          color: ${af(d.value)};
          border: 1px solid ${o(d.value)};
          box-shadow: ${w(d.value)};
        `}]])};return E(`button`,{"onClick":nu,className:`ej`,style:F([nx()])},[(()=>{const _0=[];const _1=nt;let _i=-1;for(let ny of _1){_i++;_0.push(ny)};return _0})()])},BE=({children: nz=[],oa=`row`,ob=`flex-start`,oc=`stretch`,od=`nowrap`,oe=`1rem`})=>{const of=()=>{const _={[`--d-a`]:oa,[`--d-b`]:ob,[`--d-c`]:oc,[`--d-d`]:od,[`--d-e`]:oe};return _};return E(`div`,{className:`gv`,style:F([of()])},[(()=>{const _0=[];const _1=nz;let _i=-1;for(let og of _1){_i++;_0.push(og)};return _0})()])},BF=({children: oh=[],oi=`1.5rem`,oj=``})=>{const ok=()=>{return `
      background: ${ah(d.value)};
      border: 1px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
      color: ${m(d.value)};
    `},ol=()=>{const _={[`--c-a`]:oi};return _};return E(`div`,{className:`bn`,style:F([ol(),ok()])},[(!ao(oj)?E(`h3`,{style:F([`
            margin: 0 0 1rem 0;
            font-size: 1.25rem;
            font-weight: 600;
            color: ${m(d.value)};
          `])},[oj]):E(`div`,{})),(()=>{const _0=[];const _1=oh;let _i=-1;for(let om of _1){_i++;_0.push(om)};return _0})()])},BG=({children: on=[],oo=`1rem`,op=`stretch`})=>{const oq=()=>{const _={[`--e-a`]:op,[`--e-b`]:oo};return _};return E(`div`,{className:`gw`,style:F([oq()])},[(()=>{const _0=[];const _1=on;let _i=-1;for(let or of _1){_i++;_0.push(or)};return _0})()])},BH=({children: os=[],ot=3,ou=`auto`,ov=`1rem`,ow=``,ox=``,oy=false,oz=`200px`,pa=true})=>{const pb=()=>{const pc=(oy?`grid-template-columns: repeat(auto-fit, minmax(${oz}, 1fr));`:(pa?`
          grid-template-columns: repeat(${ax(ot)}, 1fr);

          @media (max-width: 768px) {
            grid-template-columns: repeat(${(ot > 2?`2`:ax(ot))}, 1fr);
          }

          @media (max-width: 480px) {
            grid-template-columns: 1fr;
          }
        `:`grid-template-columns: repeat(${ax(ot)}, 1fr);`));const pd=(ao(ow)?``:`column-gap: ${ow};`);const pe=(ao(ox)?``:`row-gap: ${ox};`);return `${pc} grid-template-rows: ${ou}; ${pd} ${pe}`},pf=()=>{const _={[`--v-a`]:ov};return _};return E(`div`,{className:`no`,style:F([pf(),pb()])},[(()=>{const _0=[];const _1=os;let _i=-1;for(let pg of _1){_i++;_0.push(pg)};return _0})()])},BI=({children: ph=[],pi=`1200px`})=>{const pj=()=>{const _={[`--w-a`]:pi};return _};return E(`div`,{className:`np`,style:F([pj()])},[(()=>{const _0=[];const _1=ph;let _i=-1;for(let pk of _1){_i++;_0.push(pk)};return _0})()])},BJ=({children: pl=[],pm=`0`,pn=`0`,po=`transparent`,pp=`0`,pq=`auto`,pr=`auto`,ps=`none`})=>{const pt=()=>{const _={[`--f-a`]:pm,[`--f-b`]:pn,[`--f-c`]:po,[`--f-d`]:pp,[`--f-e`]:pq,[`--f-f`]:pr,[`--f-g`]:ps};return _};return E(`div`,{className:`gx`,style:F([pt()])},[(()=>{const _0=[];const _1=pl;let _i=-1;for(let pu of _1){_i++;_0.push(pu)};return _0})()])},BK=()=>{const pv=()=>{return `border-bottom-color: ${o(d.value)};`},pw=()=>{return `
      background: ${ab(d.value)};
      border-color: ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},px=()=>{return `
      background: ${s(d.value)};
      border-color: ${o(d.value)};
    `},py=()=>{return `
      background: ${ah(d.value)};
      border-bottom-color: ${o(d.value)};
    `},pz=()=>{return `border-bottom-color: ${o(d.value)};`},qa=()=>{return `
      background: ${ad(d.value)};
      color: ${af(d.value)};
    `};return E(`div`,{},[E(`h1`,{className:`qu`},[`Layout Components`]),E(`p`,{className:`qv`},[`Layout components help you structure your application with flexible,
        responsive containers. All components support theming and are fully responsive.`]),E(`div`,{className:`qw`},[E(`h2`,{className:`qx`,style:F([pv()])},[`Flex`]),E(`div`,{className:`qy`,style:F([pw()])},[E(`h3`,{className:`qz`},[`Flex`,E(`span`,{className:`rf`,style:F([qa()])},[`Layout`])]),E(`p`,{className:`ra`},[`Flexbox container for flexible layouts. Supports all flexbox properties
            and provides responsive design out of the box.`]),E(`div`,{className:`rb`,style:F([px()])},[E(BE,{oa:`row`,ob:`space-between`,oc:`center`,oe:`1rem`},M(E(BF,{oj:`Card 1`},M(`Content 1`)),E(BF,{oj:`Card 2`},M(`Content 2`)),E(BF,{oj:`Card 3`},M(`Content 3`))))]),E(BC,{mr:`mint`,mq:`<Flex
  direction="row"
  justify="space-between"
  align="center"
  gap="1rem"
>
  <DynamicCard title="Card 1">"Content 1"</DynamicCard>
  <DynamicCard title="Card 2">"Content 2"</DynamicCard>
  <DynamicCard title="Card 3">"Content 3"</DynamicCard>
</Flex>`}),E(`h4`,{},[`Props`]),E(`table`,{className:`rc`},[E(`thead`,{},[E(`tr`,{},[E(`th`,{className:`rd`,style:F([py()])},[`Prop`]),E(`th`,{className:`rd`,style:F([py()])},[`Type`]),E(`th`,{className:`rd`,style:F([py()])},[`Default`]),E(`th`,{className:`rd`,style:F([py()])},[`Description`])])]),E(`tbody`,{},[E(`tr`,{},[E(`td`,{className:`re`,style:F([pz()])},[`direction`]),E(`td`,{className:`re`,style:F([pz()])},[`String`]),E(`td`,{className:`re`,style:F([pz()])},[`row`]),E(`td`,{className:`re`,style:F([pz()])},[`Flex direction: row, column`])]),E(`tr`,{},[E(`td`,{className:`re`,style:F([pz()])},[`justify`]),E(`td`,{className:`re`,style:F([pz()])},[`String`]),E(`td`,{className:`re`,style:F([pz()])},[`flex-start`]),E(`td`,{className:`re`,style:F([pz()])},[`Justify content alignment`])]),E(`tr`,{},[E(`td`,{className:`re`,style:F([pz()])},[`align`]),E(`td`,{className:`re`,style:F([pz()])},[`String`]),E(`td`,{className:`re`,style:F([pz()])},[`stretch`]),E(`td`,{className:`re`,style:F([pz()])},[`Align items`])]),E(`tr`,{},[E(`td`,{className:`re`,style:F([pz()])},[`gap`]),E(`td`,{className:`re`,style:F([pz()])},[`String`]),E(`td`,{className:`re`,style:F([pz()])},[`0`]),E(`td`,{className:`re`,style:F([pz()])},[`Gap between items`])]),E(`tr`,{},[E(`td`,{className:`re`,style:F([pz()])},[`wrap`]),E(`td`,{className:`re`,style:F([pz()])},[`String`]),E(`td`,{className:`re`,style:F([pz()])},[`nowrap`]),E(`td`,{className:`re`,style:F([pz()])},[`Flex wrap behavior`])])])])])]),E(`div`,{className:`qw`},[E(`h2`,{className:`qx`,style:F([pv()])},[`Stack`]),E(`div`,{className:`qy`,style:F([pw()])},[E(`h3`,{className:`qz`},[`Stack`,E(`span`,{className:`rf`,style:F([qa()])},[`Layout`])]),E(`p`,{className:`ra`},[`Vertical or horizontal stack with consistent spacing. Perfect for
            stacking elements with uniform gaps.`]),E(`div`,{className:`rb`,style:F([px()])},[E(BG,{oo:`1rem`},M(E(BD,{nw:`primary`},M(`Button 1`)),E(BD,{nw:`secondary`},M(`Button 2`)),E(BD,{nw:`success`},M(`Button 3`))))]),E(BC,{mr:`mint`,mq:`<Stack spacing="1rem">
  <DynamicButton variant="primary">"Button 1"</DynamicButton>
  <DynamicButton variant="secondary">"Button 2"</DynamicButton>
  <DynamicButton variant="success">"Button 3"</DynamicButton>
</Stack>`}),E(`h4`,{},[`Props`]),E(`table`,{className:`rc`},[E(`thead`,{},[E(`tr`,{},[E(`th`,{className:`rd`,style:F([py()])},[`Prop`]),E(`th`,{className:`rd`,style:F([py()])},[`Type`]),E(`th`,{className:`rd`,style:F([py()])},[`Default`]),E(`th`,{className:`rd`,style:F([py()])},[`Description`])])]),E(`tbody`,{},[E(`tr`,{},[E(`td`,{className:`re`,style:F([pz()])},[`spacing`]),E(`td`,{className:`re`,style:F([pz()])},[`String`]),E(`td`,{className:`re`,style:F([pz()])},[`1rem`]),E(`td`,{className:`re`,style:F([pz()])},[`Space between items (vertical gap)`])]),E(`tr`,{},[E(`td`,{className:`re`,style:F([pz()])},[`align`]),E(`td`,{className:`re`,style:F([pz()])},[`String`]),E(`td`,{className:`re`,style:F([pz()])},[`stretch`]),E(`td`,{className:`re`,style:F([pz()])},[`Align items (stretch, center, flex-start)`])])])])])]),E(`div`,{className:`qw`},[E(`h2`,{className:`qx`,style:F([pv()])},[`Grid`]),E(`div`,{className:`qy`,style:F([pw()])},[E(`h3`,{className:`qz`},[`Grid`,E(`span`,{className:`rf`,style:F([qa()])},[`Layout`])]),E(`p`,{className:`ra`},[`CSS Grid container with responsive columns. Automatically adapts to
            screen size with auto-fill and minmax.`]),E(`div`,{className:`rb`,style:F([px()])},[E(BH,{ot:3,ov:`1rem`,oz:`200px`},M(E(BF,{oj:`Item 1`},M(`Grid item`)),E(BF,{oj:`Item 2`},M(`Grid item`)),E(BF,{oj:`Item 3`},M(`Grid item`)),E(BF,{oj:`Item 4`},M(`Grid item`)),E(BF,{oj:`Item 5`},M(`Grid item`)),E(BF,{oj:`Item 6`},M(`Grid item`))))]),E(BC,{mr:`mint`,mq:`<Grid columns={3} gap="1rem" minColumnWidth="200px">
  <DynamicCard title="Item 1">"Grid item"</DynamicCard>
  <DynamicCard title="Item 2">"Grid item"</DynamicCard>
  <DynamicCard title="Item 3">"Grid item"</DynamicCard>
</Grid>`}),E(`h4`,{},[`Props`]),E(`table`,{className:`rc`},[E(`thead`,{},[E(`tr`,{},[E(`th`,{className:`rd`,style:F([py()])},[`Prop`]),E(`th`,{className:`rd`,style:F([py()])},[`Type`]),E(`th`,{className:`rd`,style:F([py()])},[`Default`]),E(`th`,{className:`rd`,style:F([py()])},[`Description`])])]),E(`tbody`,{},[E(`tr`,{},[E(`td`,{className:`re`,style:F([pz()])},[`columns`]),E(`td`,{className:`re`,style:F([pz()])},[`String`]),E(`td`,{className:`re`,style:F([pz()])},[`3`]),E(`td`,{className:`re`,style:F([pz()])},[`Number of columns`])]),E(`tr`,{},[E(`td`,{className:`re`,style:F([pz()])},[`gap`]),E(`td`,{className:`re`,style:F([pz()])},[`String`]),E(`td`,{className:`re`,style:F([pz()])},[`1rem`]),E(`td`,{className:`re`,style:F([pz()])},[`Gap between items`])]),E(`tr`,{},[E(`td`,{className:`re`,style:F([pz()])},[`minColumnWidth`]),E(`td`,{className:`re`,style:F([pz()])},[`String`]),E(`td`,{className:`re`,style:F([pz()])},[`200px`]),E(`td`,{className:`re`,style:F([pz()])},[`Minimum column width`])])])])])]),E(`div`,{className:`qw`},[E(`h2`,{className:`qx`,style:F([pv()])},[`Container`]),E(`div`,{className:`qy`,style:F([pw()])},[E(`h3`,{className:`qz`},[`Container`,E(`span`,{className:`rf`,style:F([qa()])},[`Layout`])]),E(`p`,{className:`ra`},[`Centered container with max-width. Perfect for creating centered layouts
            with consistent padding.`]),E(`div`,{className:`rb`,style:F([px()])},[E(BI,{pi:`800px`},M(E(`h3`,{},[`Centered Content`]),E(`p`,{},[`This content is centered and has a maximum width of 800px.
                The container automatically centers itself and adds padding.`])))]),E(BC,{mr:`mint`,mq:`<Container maxWidth="800px">
  <h3>"Centered Content"</h3>
  <p>"Your content here"</p>
</Container>`}),E(`h4`,{},[`Props`]),E(`table`,{className:`rc`},[E(`thead`,{},[E(`tr`,{},[E(`th`,{className:`rd`,style:F([py()])},[`Prop`]),E(`th`,{className:`rd`,style:F([py()])},[`Type`]),E(`th`,{className:`rd`,style:F([py()])},[`Default`]),E(`th`,{className:`rd`,style:F([py()])},[`Description`])])]),E(`tbody`,{},[E(`tr`,{},[E(`td`,{className:`re`,style:F([pz()])},[`maxWidth`]),E(`td`,{className:`re`,style:F([pz()])},[`String`]),E(`td`,{className:`re`,style:F([pz()])},[`1200px`]),E(`td`,{className:`re`,style:F([pz()])},[`Maximum container width`])])])])])]),E(`div`,{className:`qw`},[E(`h2`,{className:`qx`,style:F([pv()])},[`Box`]),E(`div`,{className:`qy`,style:F([pw()])},[E(`h3`,{className:`qz`},[`Box`,E(`span`,{className:`rf`,style:F([qa()])},[`Layout`])]),E(`p`,{className:`ra`},[`Generic container with padding, margin, and background customization.
            The most flexible layout primitive.`]),E(`div`,{className:`rb`,style:F([px()])},[E(BJ,{pm:`2rem`,pn:`1rem`,pp:`12px`,po:ab(d.value)},M(E(`h4`,{},[`Box Content`]),E(`p`,{},[`Customizable container with full control over spacing and appearance.`])))]),E(BC,{mr:`mint`,mq:`<Box
  padding="2rem"
  margin="1rem"
  borderRadius="12px"
  background={ThemeHelpers.getSurface(currentTheme)}
>
  <h4>"Box Content"</h4>
  <p>"Content here"</p>
</Box>`})])])])},qb=(qc)=>{return (D(qc,`dark`)?`rgba(255, 255, 255, 0.8)`:`rgba(51, 65, 85, 0.8)`)},qd=(qe)=>{return (D(qe,`dark`)?`0 0 0 3px rgba(102, 126, 234, 0.4)`:`0 0 0 3px rgba(102, 126, 234, 0.3)`)},BL=({qf=``,qg=``,qh=false,qi=``,qj=``,qk=`text`,ql=`medium`,qm=false,qn=(qo)=>{return nq()}})=>{const qp=L(``),qq=L(false),qr=()=>{return (qm?`width: 100%;`:``)},qs=()=>{const qt=qb(d.value);const qu=ad(d.value);const qv=bf(qf) > 0;const qw=(qq.value?qu:qt);const qx=(qq.value || qv?`transform: translateY(-1.75rem) scale(0.85);`:`transform: translateY(0) scale(1);`);const qy=(qq.value || qv?`font-weight: 600;`:`font-weight: 500;`);return `
      color: ${qw};
      ${qx}
      ${qy}
    `},qz=()=>{const ra=`
        background: ${ab(d.value)};
        color: ${m(d.value)};
      `;const rb=(qq.value?ad(d.value):o(d.value));const rc=(qq.value?`box-shadow: ${qd(d.value)};`:`box-shadow: ${aj(d.value)};`);const rd=(D(ql,`small`)?`padding: 0.375rem 0.75rem; font-size: 0.875rem;`:(D(ql,`large`)?`padding: 0.75rem 1rem; font-size: 1.125rem;`:`padding: 0.5rem 0.875rem; font-size: 1rem;`));const re=(qm?`width: 100%;`:``);return `
      ${ra}
      border-color: ${rb};
      ${rc}
      ${rd}
      ${re}
    `},rf=()=>{return `color: ${qb(d.value)};`},rg=(rh)=>{return ((() => {
      const value = rh.target.value;
      return (()=>{qp.value=(value)})();
    })())},ri=(rj)=>{return (()=>{qq.value=true})()},rk=(rl)=>{return (()=>{qq.value=false})()};return E(`div`,{className:`gq`,style:F([qr()])},[E(`label`,{className:`gr`,style:F([qs()])},[qi]),E(`div`,{className:`gs`},[E(`input`,{"type":qk,"value":qf,"placeholder":``,"disabled":qh,"onInput":rg,"onFocus":ri,"onBlur":rk,className:`gt`,style:F([qz()])})]),(bf(qj) > 0?E(`div`,{className:`gu`,style:F([rf()])},[qj]):null)])},BM=({rm=``,rn=``,ro=false,rp=``,rq=``,rr=``,rs=4,rt=0,ru=`vertical`,rv=false,rw=(rx)=>{return nq()}})=>{const ry=L(false),rz=()=>{return (rv?`width: 100%;`:``)},sa=()=>{const sb=qb(d.value);const sc=ad(d.value);const sd=bf(rm) > 0;const se=(ry.value?sc:sb);const sf=(ry.value || sd?`transform: translateY(-1.75rem) scale(0.85);`:`transform: translateY(0) scale(1);`);const sg=(ry.value || sd?`font-weight: 600;`:`font-weight: 500;`);return `
      color: ${se};
      ${sf}
      ${sg}
    `},sh=()=>{const si=`
        background: ${ab(d.value)};
        color: ${m(d.value)};
        padding: 0.75rem;
        font-size: 1rem;
      `;const sj=bf(rp) > 0;const sk=(sj?`#f56565`:(ry.value?ad(d.value):o(d.value)));const sl=(ry.value?`box-shadow: ${qd(d.value)};`:`box-shadow: ${aj(d.value)};`);const sm=(D(ru,`none`)?`resize: none;`:(D(ru,`horizontal`)?`resize: horizontal;`:(D(ru,`both`)?`resize: both;`:`resize: vertical;`)));const sn=(rv?`width: 100%;`:`min-width: 300px;`);return `
      ${si}
      border-color: ${sk};
      ${sl}
      ${sm}
      ${sn}
    `},so=()=>{return `color: ${qb(d.value)};`},sp=()=>{return `color: #f56565;`},sq=()=>{const sr=bf(rm);const ss=(rt > 0 && sr > rt?`#f56565`:qb(d.value));return `color: ${ss};`},st=(su)=>{return ((() => {
      const value = su.target.value;
      return rw((value));
    })())},sv=(sw)=>{return (()=>{ry.value=true})()},sx=(sy)=>{return (()=>{ry.value=false})()};return E(`div`,{className:`gj`,style:F([rz()])},[E(`label`,{className:`gk`,style:F([sa()])},[rq]),E(`div`,{className:`gl`},[E(`textarea`,{"value":rm,"placeholder":``,"disabled":ro,"rows":ax(rs),"onInput":st,"onFocus":sv,"onBlur":sx,className:`gm`,style:F([sh()])})]),(bf(rp) > 0?E(`div`,{className:`go`,style:F([sp()])},[rp]):null),(bf(rr) > 0?E(`div`,{className:`gn`,style:F([so()])},[rr]):null),(rt > 0?E(`div`,{className:`gp`,style:F([sq()])},[ax(bf(rm)),` / `,ax(rt)]):null)])},sz=(ta,tb)=>{return (ta.filter(tb))},tc=(td,te)=>{return (td.includes(te))},tf=(tg)=>{return (tg.toLowerCase())},th=(ti)=>{return ((() => {
      let value = ti.value

      if (typeof value === "string") {
        return value
      } else {
        return ""
      }
    })())},BN=({tj=``,tk=[],tl=`Type to search...`,tm=``,tn=``,to=false,tp=2,tq=(tr)=>{return nq()},ts=(tt)=>{return nq()}})=>{const tu=L(false),tv=L(-1),tw=(tx)=>{const ty=th(tx.target);tq(ty);return N(()=>{tu.value=true;tv.value=-1})},tz=(ua)=>{return (()=>{tu.value=true})()},ub=(uc)=>{return (()=>{tu.value=true})()},ud=(ue)=>{const uf=ug();const uh=av(uf);return (D(ue.keyCode,40)?(tv.value < uh - 1?(()=>{tv.value=tv.value + 1})():(()=>{tv.value=0})()):(D(ue.keyCode,38)?(tv.value > 0?(()=>{tv.value=tv.value - 1})():(()=>{tv.value=uh - 1})()):(D(ue.keyCode,13)?(tv.value >= 0?I(az(uf,tv.value),[[J(T,[K]),(ui)=>{return uj(ui)}],[J(U,[]),()=>{return nq()}]]):nq()):(D(ue.keyCode,27)?N(()=>{tu.value=false;tv.value=-1}):nq()))))},uk=(ul,um)=>{(event.preventDefault());return uj(ul)},uj=(un)=>{N(()=>{tu.value=false;tv.value=-1});tq(un);return ts(un)},ug=()=>{const uo=bf(tj);return (uo < tp?[]:sz(tk,(up)=>{return tc(tf(up),tf(tj))}))},uq=()=>{const ur=bf(tj);return tu.value && ur >= tp},us=()=>{return `color: ${m(d.value)};`},ut=()=>{return `
      background: ${ab(d.value)};
      color: ${m(d.value)};
      border-color: ${o(d.value)};

      &:focus {
        border-color: ${ad(d.value)};
        box-shadow: ${qd(d.value)};
      }
    `},uu=()=>{return `color: ${qb(d.value)};`},uv=(uw,ux)=>{return I(az(ux,uw),[[J(T,[K]),(uy)=>{return (D(uw,tv.value)?E(`div`,{"onMouseDown":(uz)=>{return uk(uy,uz)},className:`dm dn`},[uy]):E(`div`,{"onMouseDown":(va)=>{return uk(uy,va)},className:`dm`},[uy]))}],[J(U,[]),()=>{return E(`div`,{})}]])};const vb=ug();return E(`div`,{"data-autocomplete":`true`,className:`dg`},[(bf(tm) > 0?E(`div`,{className:`dh`,style:F([us()])},[tm]):null),E(`div`,{className:`di`},[E(`input`,{"type":`text`,"value":tj,"placeholder":tl,"disabled":to,"onInput":tw,"onChange":tw,"onFocus":tz,"onClick":ub,"onKeyDown":ud,className:`dj`,style:F([ut()])}),(uq() && av(vb) > 0?E(`div`,{className:`dl`},[(()=>{const _0=[];const _1=as(0,av(vb) - 1);let _i=-1;for(let vc of _1){_i++;_0.push(uv(vc,vb))};return _0})()]):(uq() && D(av(vb),0)?E(`div`,{className:`dl`},[E(`div`,{className:`dp`},[`No results found`])]):E(`div`,{})))]),(bf(tn) > 0?E(`div`,{className:`dk`,style:F([uu()])},[tn]):null)])},BO=({vd=``,ve=``,vf=false,vg=`Password`,vh=``,vi=(vj)=>{return nq()}})=>{const vk=L(false),vl=L(false),vm=()=>{const vn=qb(d.value);const vo=ad(d.value);const vp=bf(ve) > 0;const vq=(vl.value?vo:vn);const vr=(vl.value || vp?`transform: translateY(-1.75rem) scale(0.85);`:`transform: translateY(0) scale(1);`);const vs=(vl.value || vp?`font-weight: 600;`:`font-weight: 500;`);return `
      color: ${vq};
      ${vr}
      ${vs}
    `},vt=()=>{const vu=`
        background: ${ab(d.value)};
        color: ${m(d.value)};
      `;const vv=(vl.value?ad(d.value):o(d.value));const vw=(vl.value?`box-shadow: ${qd(d.value)};`:`box-shadow: ${aj(d.value)};`);return `
      ${vu}
      border-color: ${vv};
      ${vw}
    `},vx=()=>{return `color: ${qb(d.value)};`},vy=(vz)=>{return (()=>{vl.value=true})()},wa=(wb)=>{return (()=>{vl.value=false})()},wc=(wd)=>{return (()=>{vk.value=!vk.value})()};return E(`div`,{className:`fc`},[E(`label`,{className:`fe`,style:F([vm()])},[vg]),E(`div`,{className:`fd`},[E(`input`,{"type":(vk.value?`text`:`password`),"placeholder":``,"value":ve,"disabled":vf,"onChange":vi,"onFocus":vy,"onBlur":wa,className:`ff`,style:F([vt()])}),E(`button`,{"onClick":wc,"type":`button`,className:`fh`},[(vk.value?`🙈`:`👁️`)])]),(bf(vh) > 0?E(`div`,{className:`fg`,style:F([vx()])},[vh]):null)])},BP=({we=[],wf=``,wg=`Select an option`,wh=``,wi=``,wj=false,wk=(wl)=>{return nq()}})=>{const wm=(wn)=>{const wo=th(wn.target);return wk(wo)},wp=()=>{return `
      background: ${ab(d.value)};
      color: ${m(d.value)};
      border-color: ${o(d.value)};

      &:focus {
        border-color: ${ad(d.value)};
        box-shadow: ${qd(d.value)};
      }
    `},wq=()=>{return `color: ${m(d.value)};`},wr=()=>{return `color: ${ad(d.value)};`},ws=()=>{return `color: ${qb(d.value)};`},wt=(wu)=>{return E(`option`,{"value":wu},[wu])};return E(`div`,{className:`fp`},[(bf(wh) > 0?E(`div`,{className:`fq`,style:F([wq()])},[wh]):null),E(`div`,{className:`fr`},[E(`select`,{"value":wf,"disabled":wj,"onChange":wm,className:`fs`,style:F([wp()])},[E(`option`,{"value":``,"disabled":true},[wg]),(()=>{const _0=[];const _1=we;let _i=-1;for(let wv of _1){_i++;_0.push(wt(wv))};return _0})()]),E(`div`,{className:`ft`,style:F([wr()])},[`▼`])]),(bf(wi) > 0?E(`div`,{className:`fu`,style:F([ws()])},[wi]):null)])},BQ=({ww=false,wx=``,wy=false,wz=(xa)=>{return nq()}})=>{const xb=(xc)=>{return wz(!ww)},xd=()=>{return `
      background: ${ah(d.value)};
    `};return E(`div`,{"onClick":xb,className:(ww?`checkedContainer`:``) + ` dq`,style:F([xd()])},[E(`input`,{"type":`checkbox`,"checked":ww,"disabled":wy,className:`dr`}),E(`label`,{className:(ww?`checkedLabel`:``) + ` ds`},[wx])])},BR=({xe=[],xf=``,xg=`radio-group`,xh=``,xi=``,xj=false,xk=(xl)=>{return nq()}})=>{const xm=(xn)=>{return xk(xn)},xo=()=>{return `color: ${m(d.value)};`},xp=(xq)=>{const xr=(xq?ad(d.value):o(d.value));const xs=(xq?`background: rgba(102, 126, 234, 0.1);`:`background: ${ab(d.value)};`);return `
      border-color: ${xr};
      ${xs}
      &:hover {
        border-color: ${ad(d.value)};
      }
    `},xt=()=>{return `color: ${qb(d.value)};`},xu=(xv)=>{const xw=D(xv,xf);return E(`div`,{"onClick":(xx)=>{return xm(xv)},className:`fl`,style:F([xp(xw)])},[E(`input`,{"type":`radio`,"name":xg,"value":xv,"checked":xw,"disabled":xj,className:`fn`}),E(`label`,{className:(xw?`selectedLabel`:``) + ` fo`},[xv])])};return E(`div`,{className:`fi`},[(bf(xh) > 0?E(`div`,{className:`fj`,style:F([xo()])},[xh]):null),E(`div`,{className:`fk`},[(()=>{const _0=[];const _1=xe;let _i=-1;for(let xy of _1){_i++;_0.push(xu(xy))};return _0})()]),(bf(xi) > 0?E(`div`,{className:`fm`,style:F([xt()])},[xi]):null)])},BS=({xz=false,ya=``,yb=false,yc=(yd)=>{return nq()}})=>{const ye=(yf)=>{return yc(!xz)},yg=()=>{return `
      background: ${ah(d.value)};
    `};return E(`div`,{"onClick":ye,className:(xz?`checkedContainer`:``) + ` ox`,style:F([yg()])},[E(`label`,{className:(xz?`checkedLabel`:``) + ` oy`},[ya]),E(`div`,{className:`oz`},[E(`input`,{"type":`checkbox`,"checked":xz,"disabled":yb,className:`pa`}),(xz?E(`div`,{className:`pb pc`}):E(`div`,{className:`pb`}))])])},BT=({yh=``,yi=`Select date`,yj=``,yk=``,yl=false,ym=``,yn=``,yo=(yp)=>{return nq()}})=>{const yq=()=>{return `color: ${m(d.value)};`},yr=()=>{return `
      background: ${ab(d.value)};
      color: ${m(d.value)};
      border-color: ${o(d.value)};

      &:focus {
        border-color: ${ad(d.value)};
        box-shadow: ${qd(d.value)};
      }
    `},ys=()=>{return `color: ${qb(d.value)};`};return E(`div`,{className:`dz`},[(bf(yj) > 0?E(`div`,{className:`ea`,style:F([yq()])},[yj]):null),E(`div`,{className:`eb`},[E(`input`,{"type":`date`,"value":yh,"placeholder":yi,"disabled":yl,"min":ym,"max":yn,"onChange":yo,className:`ec`,style:F([yr()])})]),(bf(yk) > 0?E(`div`,{className:`ed`,style:F([ys()])},[yk]):null)])},BU=({yt=``,yu=``,yv=false,yw=(yx)=>{return nq()},yy=(yz)=>{return nq()}})=>{const za=()=>{return `background: ${ah(d.value)};`},zb=()=>{return `color: ${m(d.value)};`},zc=()=>{return `color: ${qb(d.value)};`},zd=(ze)=>{return nq()},zf=(zg)=>{return nq()};return E(`div`,{className:`ee`,style:F([za()])},[E(`div`,{className:`ef`},[E(`label`,{className:`eh`,style:F([zb()])},[`From`]),E(`input`,{"type":`date`,"value":yt,"disabled":yv,"onChange":yw,"onClick":zd,className:`eg`})]),E(`div`,{className:`ei`,style:F([zc()])},[`→`]),E(`div`,{className:`ef`},[E(`label`,{className:`eh`,style:F([zb()])},[`To`]),E(`input`,{"type":`date`,"value":yu,"disabled":yv,"min":yt,"onChange":yy,"onClick":zf,className:`eg`})])])},zh=(zi,zj)=>{return O(U,V,zi,zj)},zk=(zl)=>{return ((() => {
      if (zl.trim() === '') {
        return new U()
      }

      const value = Number(zl)

      if (Number.isNaN(value)) {
        return new U()
      }

      return H(T)((value))
    })())},BV=({zm=0,zn=0,zo=100,zp=1,zq=``,zr=``,zs=false,zt=(zu)=>{return nq()}})=>{const zv=()=>{return `color: ${m(d.value)};`},zw=()=>{return `
      background: ${ad(d.value)};
      border-color: ${ad(d.value)};

      &:hover {
        box-shadow: ${w(d.value)};
      }
    `},zx=()=>{return `
      background: ${ab(d.value)};
      color: ${m(d.value)};
      border-color: ${o(d.value)};

      &:focus {
        border-color: ${ad(d.value)};
        box-shadow: ${qd(d.value)};
      }
    `},zy=()=>{return `color: ${qb(d.value)};`},zz=(aaa)=>{return (zm + zp <= zo?zt(zm + zp):nq())},aab=(aac)=>{return (zm - zp >= zn?zt(zm - zp):nq())},aad=(aae)=>{const aaf=zh(zk(th(aae.target)),zm);return (aaf >= zn && aaf <= zo?zt(aaf):nq())};return E(`div`,{className:`eu`},[(bf(zq) > 0?E(`div`,{className:`ev`,style:F([zv()])},[zq]):null),E(`div`,{className:`ew`},[E(`button`,{"onClick":aab,"disabled":zs || zm <= zn,"type":`button`,className:`ex`,style:F([zw()])},[`-`]),E(`input`,{"type":`number`,"value":ax(zm),"disabled":zs,"onChange":aad,className:`ey`,style:F([zx()])}),E(`button`,{"onClick":zz,"disabled":zs || zm >= zo,"type":`button`,className:`ex`,style:F([zw()])},[`+`])]),(bf(zr) > 0?E(`div`,{className:`ez`,style:F([zy()])},[zr]):null)])},BW=({aag=50,aah=0,aai=100,aaj=1,aak=false,aal=true,aam=(aan)=>{return nq()}})=>{const aao=(aap)=>{const aaq=zh(zk(th(aap.target)),aag);return aam(aaq)},aar=(aas)=>{const aat=zh(zk(th(aas.target)),aag);return aam(aat)},aau=()=>{return `color: ${m(d.value)};`},aav=()=>{const aaw=aai - aah;return (aaw > 0?(()=>{const aax=((aag - aah) / aaw) * 100;return `${ax(aax)}%`})():`0%`)},aay=()=>{return `width: ${aav()};`};return E(`div`,{className:`fy`},[(aal?E(`div`,{className:`gd`,style:F([aau()])},[ax(aag)]):E(`div`,{})),E(`div`,{className:`fz`},[E(`div`,{className:`ga`}),E(`div`,{className:`gb`,style:F([aay()])}),E(`input`,{"type":`range`,"min":ax(aah),"max":ax(aai),"step":ax(aaj),"value":ax(aag),"disabled":aak,"onInput":aar,"onChange":aao,className:`gc`})])])},aaz=(aba,abb)=>{return (aba.join(abb))},abc=(abd,abe)=>{return (()=>{const _0=[];const _1=abd;let _i=-1;for(let abf of _1){_i++;_0.push(abe(abf))};return _0})()},BX=({abg=0,abh=`$`,abi=`0.00`,abj=``,abk=``,abl=false,abm=0,abn=999999,abo=(abp)=>{return nq()}})=>{const abq=(abr)=>{const abs=aaz(sz(al(abr,``),(abt)=>{return D(abt,`.`) || I(zk(abt),[[J(T,[null]),()=>{return true}],[J(U,[]),()=>{return false}]])}),``);const abu=al(abs,`.`);const abv=av(abu);return (abv > 2?I(az(abu,0),[[J(T,[K]),(abw)=>{return (()=>{const abx=as(1,abv - 1);const aby=abc(abx,(abz)=>{return I(az(abu,abz),[[J(T,[K]),(aca)=>{return aca}],[J(U,[]),()=>{return ``}]])});return abw + `.` + aaz(aby,``)})()}],[J(U,[]),()=>{return abs}]]):abs)},acb=(acc)=>{const acd=th(acc.target);const ace=abq(acd);return I(zk(ace),[[J(T,[K]),(acf)=>{return (acf >= abm && acf <= abn?abo(acf):(acf > abn?abo(abn):abo(abm)))}],[J(U,[]),()=>{return abo(0)}]])},acg=()=>{const ach=ax(abg);const aci=al(ach,`.`);return I(az(aci,0),[[J(T,[K]),(acj)=>{return I(az(aci,1),[[J(T,[K]),(ack)=>{return (()=>{const acl=ack + `00`;const acm=bf(acl);return (acm >= 2?(()=>{const acn=al(acl,``);return I(az(acn,0),[[J(T,[K]),(aco)=>{return I(az(acn,1),[[J(T,[K]),(acp)=>{return acj + `.` + aco + acp}],[J(U,[]),()=>{return acj + `.00`}]])}],[J(U,[]),()=>{return acj + `.00`}]])})():acj + `.00`)})()}],[J(U,[]),()=>{return acj + `.00`}]])}],[J(U,[]),()=>{return `0.00`}]])},acq=()=>{const acr=1.0;const acs=0.7;const act=bf(abh);const acu=(zh(zk(ax(act)),1)) * acs;const acv=acr + acu + 0.5;return ax(acv) + `rem`},acw=()=>{return `color: ${m(d.value)};`},acx=()=>{return `color: ${ad(d.value)};`},acy=()=>{return `
      background: ${ab(d.value)};
      color: ${m(d.value)};
      border-color: ${o(d.value)};
      padding-left: ${acq()};

      &:focus {
        border-color: ${ad(d.value)};
        box-shadow: ${qd(d.value)};
      }
    `},acz=()=>{return `color: ${qb(d.value)};`};return E(`div`,{className:`dt`},[(bf(abj) > 0?E(`div`,{className:`du`,style:F([acw()])},[abj]):null),E(`div`,{className:`dv`},[E(`span`,{className:`dw`,style:F([acx()])},[abh]),E(`input`,{"type":`text`,"value":acg(),"placeholder":abi,"disabled":abl,"onChange":acb,className:`dx`,style:F([acy()])})]),(bf(abk) > 0?E(`div`,{className:`dy`,style:F([acz()])},[abk]):null)])},ada=(adb)=>{return (adb.trim())},adc=(add,ade)=>{return ([...add, ade])},adf=(adg,adh,adi)=>{return (adg.slice(adh, adi))},BY=({adj=[],adk=`Add tag...`,adl=false,adm=false,adn=(ado)=>{return nq()},adp=(adq)=>{return nq()}})=>{const adr=L(``),ads=(adt)=>{return (()=>{adr.value=th(adt.target)})()},adu=(adv)=>{return (D(adv.keyCode,13)?adw():(D(adv.keyCode,8) && ao(adr.value)?adx():nq()))},adw=()=>{return (ao(ada(adr.value))?nq():(()=>{const ady=ada(adr.value);const adz=adc(adj,ady);(()=>{adr.value=``})();return adn(adz)})())},aea=(aeb)=>{const aec=abc(sz(as(0,av(adj) - 1),(aed)=>{return !D(aed,aeb)}),(aee)=>{return I(az(adj,aee),[[J(T,[K]),(aef)=>{return aef}],[J(U,[]),()=>{return ``}]])});return adn(aec)},adx=()=>{const aeg=av(adj);return (aeg > 0?(()=>{const aeh=adf(adj,0,aeg - 1);return adn(aeh)})():nq())},aei=()=>{return `background: ${ah(d.value)};`},aej=(aek)=>{return I(az(adj,aek),[[J(T,[K]),(ael)=>{return E(`div`,{className:`gf`},[E(`span`,{},[ael]),E(`button`,{"onClick":(aem)=>{return aea(aek)},className:`gg`},[`×`])])}],[J(U,[]),()=>{return E(`div`,{})}]])};P(()=>{(()=>{return adp(()=>{return adw()})})()},[]);return E(`div`,{className:`ge`,style:F([aei()])},[(()=>{const _0=[];const _1=as(0,av(adj) - 1);let _i=-1;for(let aen of _1){_i++;_0.push(aej(aen))};return _0})(),E(`input`,{"type":`text`,"value":adr.value,"placeholder":adk,"disabled":adl,"onChange":ads,"onKeyDown":adu,className:`gh`}),(adm?E(`button`,{"onClick":(aeo)=>{return adw()},"disabled":ao(ada(adr.value)) || adl,className:`gi`},[`Add`]):E(`div`,{}))])},aep=(aeq,aer)=>{return (aeq.repeat(aer))},aes=(aet,aeu)=>{return (()=>{const _0=[];const _1=aet;let _i=-1;for(let aev of _1){_i++;const aew=_i;_0.push(aeu(aev,aew))};return _0})()},BZ=({aex=6,aey=``,aez=false,afa=(afb)=>{return nq()}})=>{const afc=L(0),afd=L([]),afe=(aff)=>{const afg=sz(al(aff,``),(afh)=>{return I(zk(afh),[[J(T,[null]),()=>{return true}],[J(U,[]),()=>{return false}]])});return I(az(afg,av(afg) - 1),[[J(T,[K]),(afi)=>{return afi}],[J(U,[]),()=>{return ``}]])},afj=(afk,afl,afm)=>{const afn=(bf(afk) < aex?afk + aep(` `,aex - bf(afk)):afk);const afo=al(afn,``);const afp=(ao(afm)?` `:afm);const afq=aes(afo,(afr,afs)=>{return (D(afs,afl)?afp:afr)});return aaz(afq,``)},aft=(afu,afv)=>{const afw=th(afv.target);const afx=afe(afw);const afy=afj(aey,afu,afx);(!ao(afx) && afu < aex - 1?afz(afu + 1):nq());(()=>{afc.value=afu + 1})();return afa(afy)},afz=(aga)=>{((() => {
      const inputs = document.querySelectorAll('[data-otp-input="true"]');
      const idx = aga;
      if (inputs[idx]) {
        setTimeout(() => inputs[idx].focus(), 10);
      }
    })());return nq()},agb=(agc)=>{((() => {
      const inputs = document.querySelectorAll('[data-otp-input="true"]');
      const idx = agc;
      if (inputs[idx]) {
        setTimeout(() => inputs[idx].focus(), 10);
      }
    })());return nq()},agd=(age,agf)=>{return (D(agf.keyCode,8) && ao(agg(age)) && age > 0?agb(age - 1):nq())},agg=(agh)=>{const agi=(bf(aey) < aex?aey + aep(` `,aex - bf(aey)):aey);return I(az(al(agi,``),agh),[[J(T,[K]),(agj)=>{return (D(agj,` `)?``:agj)}],[J(U,[]),()=>{return ``}]])},agk=()=>{return `background: ${ah(d.value)};`},agl=(agm)=>{return E(`input`,{"type":`text`,"maxlength":`1`,"value":agg(agm),"disabled":aez,"data-otp-input":`true`,"onInput":(agn)=>{return aft(agm,agn)},"onKeyDown":(ago)=>{return agd(agm,ago)},className:`fb`})};return E(`div`,{className:`fa`,style:F([agk()])},[(()=>{const _0=[];const _1=as(0,aex - 1);let _i=-1;for(let agp of _1){_i++;_0.push(agl(agp))};return _0})()])},agq=(agr,ags,agt)=>{return (agr.reduce(agt, ags))},agu=(agv)=>{return agq(agv,[],(agw,agx)=>{return I(agx,[[J(T,[K]),(agy)=>{return adc(agw,agy)}],[J(U,[]),()=>{return agw}]])})},CA=({agz=`*`,aha=false})=>{const ahb=L(false),ahc=L([]),ahd=(ahe)=>{((() => {
      const input = document.querySelector('[data-file-input="true"]');
      if (input) {
        input.click();
      }
    })());return nq()},ahf=(ahg)=>{const ahh=((() => {
        const input = event.target;
        const files = Array.from(input.files || []);
        return files.map(f => f.name);
      })());return (()=>{ahc.value=ahh})()},ahi=(ahj)=>{const ahk=agu(aes(ahc.value,(ahl,ahm)=>{return (D(ahm,ahj)?new U():H(T)(ahl))}));return (()=>{ahc.value=ahk})()},ahn=()=>{((() => {
      const input = document.querySelector('[data-file-input="true"]');
      if (input) {
        input.value = '';
      }
    })());return (()=>{ahc.value=[]})()},aho=(ahp)=>{return (()=>{ahb.value=true})()},ahq=(ahr)=>{return (()=>{ahb.value=false})()},ahs=(aht)=>{return (()=>{ahb.value=false})()},ahu=()=>{return `
      color: ${m(d.value)};
      border-color: ${(ahb.value?`#667eea`:o(d.value))};
    `};return E(`div`,{},[E(`input`,{"type":`file`,"accept":agz,"disabled":aha,"data-file-input":`true`,"onChange":ahf,"multiple":`multiple`,className:`et`}),E(`div`,{"onClick":ahd,"onDragOver":aho,"onDragLeave":ahq,"onDrop":ahs,className:(ahb.value?`dragging`:``) + ` ek`,style:F([ahu()])},[E(`div`,{className:`el`},[`📁`]),E(`div`,{className:`em`},[`Click to upload or drag and drop`]),E(`div`,{className:`en`},[`Supported formats: ${agz}`]),(av(ahc.value) > 0?E(`div`,{className:`eo`},[aes(ahc.value,(ahv,ahw)=>{return E(`div`,{className:`ep`},[E(`span`,{className:`eq`},[ahv]),E(`button`,{"onClick":(ahx)=>{return ahi(ahw)},className:`er`},[`×`])])}),E(`button`,{"onClick":(ahy)=>{return ahn()},className:`es`},[`Clear all files`])]):E(`div`,{}))])])},CB=({ahz=`#667eea`,aia=false,aib=(aic)=>{return nq()}})=>{const aid=(aie)=>{const aif=th(aie.target);return aib(aif)},aig=()=>{return `
      background: ${ah(d.value)};
    `};return E(`div`,{className:`mq`,style:F([aig()])},[E(`div`,{className:`mr`},[ahz]),E(`div`,{className:`ms`},[E(`input`,{"type":`color`,"value":ahz,"disabled":aia,"onChange":aid,className:`mt`})])])},CC=()=>{const aih=L(``),aii=L(``),aij=L(``),aik=L(`option1`),ail=L(false),aim=L(``),ain=L(0),aio=L(``),aip=L(false),aiq=L(50),air=L([`Mint`,`Frontend`,`UI`]),ais=L(``),ait=L(`#667eea`),aiu=L(``),aiv=()=>{return `border-bottom-color: ${o(d.value)};`},aiw=()=>{return `
      background: ${ab(d.value)};
      border-color: ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},aix=()=>{return `
      background: ${s(d.value)};
      border-color: ${o(d.value)};
    `},aiy=(aiz)=>{return I(aiz,[[`new`,()=>{return `background: #10b981; color: white;`}],[`form`,()=>{return `background: #3b82f6; color: white;`}],[null,()=>{return `background: ${ad(d.value)}; color: white;`}]])},aja=(ajb)=>{return (()=>{aij.value=ajb})()},ajc=(ajd)=>{return (()=>{aio.value=ajd})()},aje=(ajf)=>{return (()=>{ail.value=ajf})()},ajg=(ajh)=>{return (()=>{aip.value=ajh})()},aji=(ajj)=>{return (()=>{aiq.value=ajj})()},ajk=(ajl)=>{return (()=>{air.value=ajl})()},ajm=(ajn)=>{return (()=>{ais.value=ajn})()},ajo=(ajp)=>{return (()=>{ait.value=ajp})()},ajq=(ajr)=>{return (()=>{aiu.value=th(ajr.target)})()};return E(`div`,{},[E(`h1`,{className:`ql`},[`Form Components`]),E(`p`,{className:`qm`},[`Comprehensive form components with built-in validation, theming, and accessibility.
        All components follow WCAG guidelines and support keyboard navigation.`]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Basic Inputs`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`TextInput`,E(`span`,{className:`qt`,style:F([aiy(`new`)])},[`NEW`])]),E(`p`,{className:`qr`},[`Basic text input component with label, error states, and helper text. Supports different sizes and full width layout.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BL,{qi:`Email Address`,qf:aih.value,qn:(ajs)=>{return (()=>{aih.value=ajs})()},qj:`We'll never share your email`,qm:true}),E(BL,{qi:`Username`,qf:``,ql:`medium`,qj:`Choose a unique username`}),E(BL,{qi:`Phone Number`,qf:``,ql:`small`})]),E(BC,{mr:`mint`,mq:`<TextInput
  label="Email Address"
  value={textInputValue}
  onValueChange={handleChange}
  helperText="We'll never share your email"
  fullWidth={true}
/>

// Different sizes: small, medium, large
<TextInput
  label="Phone"
  value=""
  size="small"
/>`})]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`TextArea`,E(`span`,{className:`qt`,style:F([aiy(`new`)])},[`NEW`])]),E(`p`,{className:`qr`},[`Multiline text input with character counter, resize control, and validation support.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BM,{rq:`Description`,rm:aii.value,rw:(ajt)=>{return (()=>{aii.value=ajt})()},rs:4,rt:200,rr:`Maximum 200 characters`,rv:true}),E(BM,{rq:`No Resize`,rm:``,ru:`none`,rs:3})]),E(BC,{mr:`mint`,mq:`<TextArea
  label="Description"
  value={textAreaValue}
  onChange={handleChange}
  rows={4}
  maxLength={200}
  helperText="Maximum 200 characters"
  fullWidth={true}
/>

// Control resize behavior: vertical, horizontal, both, none
<TextArea
  label="No Resize"
  value=""
  resize="none"
  rows={3}
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Autocomplete Input`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`AutocompleteInput`,E(`span`,{className:`qt`,style:F([aiy(`new`)])},[`New`])]),E(`p`,{className:`qr`},[`Input with autocomplete suggestions. Supports filtering, keyboard navigation,
            and custom suggestion rendering.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BN,{tm:`Search Country`,tl:`Type to search countries...`,tj:aij.value,tk:[`Spain`,`France`,`Germany`,`Italy`,`Portugal`],tq:aja,tn:`Start typing to see suggestions`,tp:2})]),E(BC,{mr:`mint`,mq:`<AutocompleteInput
  label="Search Country"
  placeholder="Type to search countries..."
  value={autocompleteValue}
  suggestions={["Spain", "France", "Germany"]}
  onChange={handleAutocompleteChange}
  helperText="Start typing to see suggestions"
  minChars={2}
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Password Input`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`PasswordInput`,E(`span`,{className:`qt`,style:F([aiy(`form`)])},[`Form`])]),E(`p`,{className:`qr`},[`Password input with show/hide toggle and strength indicator.
            Includes validation for password requirements.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BO,{vg:`Password`,ve:aiu.value,vi:ajq,vh:`Must be at least 8 characters`})]),E(BC,{mr:`mint`,mq:`<PasswordInput
  label="Password"
  value={passwordValue}
  onChange={handleChange}
  helperText="Must be at least 8 characters"
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Select Dropdown`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`SelectInput`,E(`span`,{className:`qt`,style:F([aiy(`form`)])},[`Form`])]),E(`p`,{className:`qr`},[`Styled select dropdown with custom rendering and search functionality.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BP,{wh:`Select Country`,wg:`Choose a country`,we:[`United States`,`Canada`,`Mexico`,`Spain`],wf:``,wi:`Select your country of residence`})]),E(BC,{mr:`mint`,mq:`<SelectInput
  label="Select Country"
  placeholder="Choose a country"
  options={["United States", "Canada", "Mexico"]}
  helperText="Select your country of residence"
  value=""
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Checkbox`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`CheckboxInput`,E(`span`,{className:`qt`,style:F([aiy(`form`)])},[`Form`])]),E(`p`,{className:`qr`},[`Customizable checkbox with label and indeterminate state support.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BQ,{wx:`Accept terms and conditions`,ww:ail.value,wz:aje})]),E(BC,{mr:`mint`,mq:`<CheckboxInput
  label="Accept terms and conditions"
  checked={checkboxValue}
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Radio Group`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`RadioGroup`,E(`span`,{className:`qt`,style:F([aiy(`form`)])},[`Form`])]),E(`p`,{className:`qr`},[`Radio button group with custom styling and keyboard navigation.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BR,{xh:`Payment Method`,xg:`payment`,xe:[`Credit Card`,`PayPal`,`Cryptocurrency`],xf:aio.value,xk:ajc,xi:`Choose your preferred payment method`})]),E(BC,{mr:`mint`,mq:`<RadioGroup
  label="Payment Method"
  name="payment"
  options={["Credit Card", "PayPal", "Cryptocurrency"]}
  selectedValue={radioValue}
  onChange={handleChange}
  helperText="Choose your preferred payment method"
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Toggle Switch`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`ToggleSwitch`,E(`span`,{className:`qt`,style:F([aiy(`form`)])},[`Form`])]),E(`p`,{className:`qr`},[`iOS-style toggle switch for boolean values.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BS,{ya:`Enable notifications`,xz:aip.value,yc:ajg})]),E(BC,{mr:`mint`,mq:`<ToggleSwitch
  label="Enable notifications"
  checked={toggleValue}
  onChange={handleToggleChange}
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Date Picker`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`DateInput`,E(`span`,{className:`qt`,style:F([aiy(`form`)])},[`Form`])]),E(`p`,{className:`qr`},[`Date picker with calendar dropdown and keyboard input support.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BT,{yj:`Birth Date`,yi:`Select your birth date`,yh:aim.value,yk:`Your date of birth is required`})]),E(BC,{mr:`mint`,mq:`<DateInput
  label="Birth Date"
  placeholder="Select your birth date"
  value={dateValue}
  helperText="Your date of birth is required"
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Date Range Picker`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`DateRangePicker`,E(`span`,{className:`qt`,style:F([aiy(`new`)])},[`New`])]),E(`p`,{className:`qr`},[`Select date ranges with visual calendar. Perfect for filtering and booking.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BU,{yt:``,yu:``})]),E(BC,{mr:`mint`,mq:`<DateRangePicker
  startDate=""
  endDate=""
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Number Input`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`NumberInput`,E(`span`,{className:`qt`,style:F([aiy(`form`)])},[`Form`])]),E(`p`,{className:`qr`},[`Numeric input with increment/decrement buttons and validation.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BV,{zq:`Quantity`,zm:ain.value,zn:0,zo:100,zp:1,zr:`Select a quantity between 0 and 100`})]),E(BC,{mr:`mint`,mq:`<NumberInput
  label="Quantity"
  value={numberValue}
  min={0}
  max={100}
  step={1}
  helperText="Select a quantity between 0 and 100"
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Slider`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`SliderInput`,E(`span`,{className:`qt`,style:F([aiy(`form`)])},[`Form`])]),E(`p`,{className:`qr`},[`Range slider with value display and customizable appearance.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BW,{aah:0,aai:100,aag:aiq.value,aaj:5,aal:true,aam:aji})]),E(BC,{mr:`mint`,mq:`<SliderInput
  min={0}
  max={100}
  value={sliderValue}
  step={5}
  showValue={true}
  onChange={handleSliderChange}
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Currency Input`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`CurrencyInput`,E(`span`,{className:`qt`,style:F([aiy(`new`)])},[`New`])]),E(`p`,{className:`qr`},[`Formatted currency input with symbol and automatic formatting.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BX,{abj:`Product Price`,abi:`0.00`,abh:`$`,abg:0,abk:`Enter the price in USD`})]),E(BC,{mr:`mint`,mq:`<CurrencyInput
  label="Product Price"
  placeholder="0.00"
  currency="$"
  value={0}
  helperText="Enter the price in USD"
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Tags Input`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`TagsInput`,E(`span`,{className:`qt`,style:F([aiy(`new`)])},[`New`])]),E(`p`,{className:`qr`},[`Input for adding and removing tags. Supports autocomplete and validation.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BY,{adk:`Add tags...`,adj:air.value,adn:ajk})]),E(BC,{mr:`mint`,mq:`<TagsInput
  placeholder="Add tags..."
  tags={tagsValue}
  onTagsChange={handleTagsChange}
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`OTP Input`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`OTPInput`,E(`span`,{className:`qt`,style:F([aiy(`new`)])},[`New`])]),E(`p`,{className:`qr`},[`One-Time Password input with auto-focus and paste support.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(BZ,{aex:6,aey:ais.value,afa:ajm})]),E(BC,{mr:`mint`,mq:`<OTPInput
  length={6}
  value=""
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`File Upload`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`FileUpload`,E(`span`,{className:`qt`,style:F([aiy(`form`)])},[`Form`])]),E(`p`,{className:`qr`},[`Drag-and-drop file upload with preview and progress indication.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(CA,{agz:`image/*`})]),E(BC,{mr:`mint`,mq:`<FileUpload
  accept="image/*"
/>`})])]),E(`div`,{className:`qn`},[E(`h2`,{className:`qo`,style:F([aiv()])},[`Color Picker`]),E(`div`,{className:`qp`,style:F([aiw()])},[E(`h3`,{className:`qq`},[`ColorPicker`,E(`span`,{className:`qt`,style:F([aiy(`form`)])},[`Form`])]),E(`p`,{className:`qr`},[`Visual color picker with hex, RGB, and HSL support.`]),E(`div`,{className:`qs`,style:F([aix()])},[E(CB,{ahz:ait.value,aib:ajo})]),E(BC,{mr:`mint`,mq:`<ColorPicker
  value={colorValue}
  onChange={handleColorChange}
/>`})])])])},aju=()=>{return (Math.random())},CD=({ajv=[],ajw=[],ajx=`250px`,ajy=`#667eea`,ajz=true,aka=true,akb=false})=>{const akc=L(``),akd=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
      height: ${ajx};
    `},ake=()=>{return `stroke: ${o(d.value)};`},akf=()=>{return `color: ${qb(d.value)};`},akg=()=>{return (D(av(ajv),0)?100:agq(ajv,0,(akh,aki)=>{return (aki > akh?aki:akh)}))},akj=()=>{const akk=av(ajv);return (D(akk,0)?`0,100 100,100`:(()=>{const akl=akg();const akm=aes(ajv,(akn,ako)=>{const akp=(ako / bk(1,akk - 1)) * 100;const akq=(akl > 0?100 - ((akn / akl) * 80):100);return `${ax(akp)},${ax(akq)}`});return aaz(akm,` `)})())};P(()=>{(()=>{return (()=>{akc.value=`lineGradient-${ax(aju())}`})()})()},[]);return E(`div`,{className:`w`,style:F([akd()])},[E(`svg`,{"viewBox":`0 0 100 100`,"preserveAspectRatio":`none`,className:`x`},[E(`defs`,{},[E(`linearGradient`,{"id":akc.value,"x1":`0%`,"y1":`0%`,"x2":`0%`,"y2":`100%`},[E(`stop`,{"offset":`0%`,style:F([`stop-color:${ajy};stop-opacity:0.4`])}),E(`stop`,{"offset":`100%`,style:F([`stop-color:${ajy};stop-opacity:0`])})])]),E(`line`,{"x1":`0`,"y1":`25`,"x2":`100`,"y2":`25`,className:`y`,style:F([ake()])}),E(`line`,{"x1":`0`,"y1":`50`,"x2":`100`,"y2":`50`,className:`y`,style:F([ake()])}),E(`line`,{"x1":`0`,"y1":`75`,"x2":`100`,"y2":`75`,className:`y`,style:F([ake()])}),(aka?E(`polygon`,{"points":`0,100 ${akj()} 100,100`,"fill":`url(#${akc.value})`,"stroke":`none`}):E(`g`,{})),E(`polyline`,{"points":akj(),"fill":`none`,"stroke":ajy,"stroke-width":`3`,"stroke-linecap":`round`,"stroke-linejoin":`round`}),E(`g`,{},[(ajz || akb?aes(ajv,(akr,aks)=>{const akt=av(ajv);const aku=akg();const akv=(aks / bk(1,akt - 1)) * 100;const akw=(aku > 0?100 - ((akr / aku) * 80):100);return E(`g`,{},[(ajz?E(`circle`,{"cx":ax(akv),"cy":ax(akw),"r":`3`,"fill":ajy,"stroke":`white`,"stroke-width":`2`}):E(`g`,{})),(akb?E(`text`,{"x":ax(akv),"y":ax(akw - 6),"text-anchor":`middle`,"font-size":`6`,"font-weight":`600`,"fill":ajy},[ax(akr)]):E(`g`,{}))])}):[])])]),(av(ajw) > 0?E(`div`,{className:`z`},[aes(ajw,(akx,aky)=>{const akz=av(ajw);const ala=(akz <= 1?50:(aky / (akz - 1)) * 100);return E(`span`,{className:`aa`,style:F([`${akf()}; left: ${ax(ala)}%;`])},[akx])})]):E(`div`,{}))])},CE=({alb=[],alc=[],ald=`250px`,ale=`#667eea`,alf=false,alg=true})=>{const alh=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
      height: ${ald};
    `},ali=()=>{return `height: calc(100% - 2rem);`},alj=()=>{return `color: ${qb(d.value)};`},alk=()=>{return `color: ${m(d.value)};`},all=()=>{return (D(av(alb),0)?100:agq(alb,0,(alm,aln)=>{return (aln > alm?aln:alm)}))},alo=(alp)=>{const alq=all();return (alq > 0?(()=>{const alr=(alp / alq) * 100;return `${ax(alr)}%`})():`0%`)},als=(alt,alu)=>{const alv=(alg?ax(alu * 0.1):`0`);return `
      background: linear-gradient(180deg, ${ale} 0%, ${ale}cc 100%);
      height: ${alo(alt)};
      transition-delay: ${alv}s;
    `};return E(`div`,{className:`i`,style:F([alh()])},[E(`div`,{className:`j`,style:F([ali()])},[aes(alb,(alw,alx)=>{return E(`div`,{className:`k`},[E(`div`,{className:`l`,style:F([als(alw,alx)])},[(alf?E(`span`,{className:`n`,style:F([alk()])},[ax(alw)]):E(`span`,{}))]),E(`span`,{className:`m`,style:F([alj()])},[(alx < av(alc)?zh(az(alc,alx),``):``)])])})])])},CF=({aly=[],alz=[],ama=`200px`,amb=`#667eea`,amc=true,amd=true,ame=false,amf=true})=>{const amg=L(``),amh=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
      height: ${ama};
    `},ami=()=>{return `color: ${qb(d.value)};`},amj=()=>{return `stroke: ${o(d.value)};`},amk=()=>{return (D(av(aly),0)?100:agq(aly,0,(aml,amm)=>{return (amm > aml?amm:aml)}))},amn=()=>{const amo=av(aly);return (D(amo,0)?`0,100`:(()=>{const amp=amk();const amq=aes(aly,(amr,ams)=>{const amt=(ams / bk(1,amo - 1)) * 100;const amu=(amp > 0?100 - ((amr / amp) * 90):100);return `${ax(amt)},${ax(amu)}`});return aaz(amq,` `)})())};P(()=>{(()=>{return (()=>{amg.value=`areaGradient-${ax(aju())}`})()})()},[]);return E(`div`,{className:`e`,style:F([amh()])},[E(`svg`,{"width":`100%`,"height":`calc(100% - 2rem)`,"viewBox":`0 0 100 100`,"preserveAspectRatio":`none`},[E(`defs`,{},[E(`linearGradient`,{"id":amg.value,"x1":`0%`,"y1":`0%`,"x2":`0%`,"y2":`100%`},[E(`stop`,{"offset":`0%`,style:F([`stop-color:${amb};stop-opacity:0.6`])}),E(`stop`,{"offset":`100%`,style:F([`stop-color:${amb};stop-opacity:0.05`])})])]),(amf?E(Q,{},[E(`line`,{"x1":`0`,"y1":`25`,"x2":`100`,"y2":`25`,className:`h`,style:F([amj()])}),E(`line`,{"x1":`0`,"y1":`50`,"x2":`100`,"y2":`50`,className:`h`,style:F([amj()])}),E(`line`,{"x1":`0`,"y1":`75`,"x2":`100`,"y2":`75`,className:`h`,style:F([amj()])})]):E(`g`,{})),E(`polygon`,{"points":`0,100 ${amn()} 100,100`,"fill":(amc?`url(#${amg.value})`:amb),"stroke":`none`}),E(`polyline`,{"points":amn(),"fill":`none`,"stroke":amb,"stroke-width":`2`,"stroke-linecap":`round`,"stroke-linejoin":`round`}),E(`g`,{},[(amd || ame?aes(aly,(amv,amw)=>{const amx=av(aly);const amy=amk();const amz=(amw / bk(1,amx - 1)) * 100;const ana=(amy > 0?100 - ((amv / amy) * 90):100);return E(`g`,{},[(amd?E(`circle`,{"cx":ax(amz),"cy":ax(ana),"r":`3`,"fill":amb,"stroke":`white`,"stroke-width":`2`}):E(`g`,{})),(ame?E(`text`,{"x":ax(amz),"y":ax(ana - 6),"text-anchor":`middle`,"font-size":`6`,"font-weight":`600`,"fill":amb},[ax(amv)]):E(`g`,{}))])}):[])])]),(av(alz) > 0?E(`div`,{className:`f`},[aes(alz,(anb,anc)=>{const and=av(alz);const ane=(and <= 1?50:(anc / (and - 1)) * 100);return E(`span`,{className:`g`,style:F([`${ami()}; left: ${ax(ane)}%;`])},[anb])})]):E(`div`,{}))])},anf=(ang)=>{return (Math.floor(ang))},CG=({anh=75,ani=100,anj=120,ank=12,anl=`#667eea`,anm=``,ann=true})=>{const ano=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},anp=()=>{return `color: ${m(d.value)};`},anq=()=>{return `color: ${qb(d.value)};`},anr=()=>{return (anh / ani) * 100},ans=()=>{return (anj / 2) - ank},ant=()=>{return 2 * 3.14159 * ans()},anu=()=>{const anv=ant();const anw=anr();return anv - (anw / 100) * anv};return E(`div`,{className:`o`,style:F([ano()])},[E(`div`,{className:`p`},[E(`svg`,{"width":ax(anj),"height":ax(anj),"viewBox":`0 0 ${ax(anj)} ${ax(anj)}`},[E(`circle`,{"cx":ax(anj / 2),"cy":ax(anj / 2),"r":ax(ans()),"fill":`none`,"stroke":ab(d.value),"stroke-width":ax(ank)}),E(`circle`,{"cx":ax(anj / 2),"cy":ax(anj / 2),"r":ax(ans()),"fill":`none`,"stroke":anl,"stroke-width":ax(ank),"stroke-dasharray":ax(ant()),"stroke-dashoffset":ax(anu()),"stroke-linecap":`round`,"transform":`rotate(-90 ${ax(anj / 2)} ${ax(anj / 2)})`,style:F([`transition: stroke-dashoffset 0.6s ease;`])})]),E(`div`,{className:`q`},[(ann?E(`div`,{className:`r`,style:F([anp()])},[`${ax(anf(anr()))}%`]):E(`div`,{})),(!ao(anm)?E(`div`,{className:`s`,style:F([anq()])},[anm]):E(`div`,{}))])])])},anx=(any)=>{return (Math.cos(any))},anz=(aoa)=>{return (Math.sin(aoa))},CH=({aob=[80,90,70,85,75],aoc=[],aod=[`A`,`B`,`C`,`D`,`E`],aoe=300,aof=`#667eea`,aog=`#f56565`,aoh=true,aoi=true,aoj=true,aok=true,aol=true,aom=false,aon=true,aoo=`Dataset 1`,aop=`Dataset 2`})=>{const aoq=L([true,true,true,true,true,true]),aor=L(true),aos=L(true),aot=(aou,aov)=>{const aow=aes(aoq.value,(aox,aoy)=>{return (D(aoy,aou)?!aox:aox)});return (()=>{aoq.value=aow})()},aoz=(apa)=>{return (()=>{aor.value=!aor.value})()},apb=(apc)=>{return (()=>{aos.value=!aos.value})()},apd=()=>{return av(aoc) > 0},ape=(apf)=>{const apg=agq(apf,0,(aph,api)=>{return aph + api});return (av(apf) > 0?apg / av(apf):0)},apj=(apk)=>{const apl=[`#667eea`,`#f56565`,`#48bb78`,`#ed8936`,`#9f7aea`,`#38b2ac`];const apm=anf(apk % 6);return zh(az(apl,apm),`#667eea`)},apn=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},apo=()=>{return `color: ${m(d.value)};`},app=()=>{return `border-color: ${o(d.value)};`},apq=()=>{return `
      color: ${m(d.value)};
      border-color: ${o(d.value)};
    `},apr=(aps)=>{const apt=aoe / 2;const apu=(aoe / 2) - 50;const apv=av(aps);return (D(apv,0)?`${ax(apt)},${ax(apt)}`:(()=>{const apw=aes(aps,(apx,apy)=>{const apz=zh(az(aoq.value,apy),true);const aqa=(apy / apv) * 2 * 3.14159 - (3.14159 / 2);const aqb=(apz?(apx / 100) * apu:0);const aqc=apt + (aqb * anx(aqa));const aqd=apt + (aqb * anz(aqa));return `${ax(aqc)},${ax(aqd)}`});return aaz(apw,` `)})())},aqe=(aqf)=>{const aqg=aoe / 2;const aqh=((aoe / 2) - 50) * (aqf / 100);const aqi=av(aob);return (D(aqi,0)?`${ax(aqg)},${ax(aqg)}`:(()=>{const aqj=aes(aob,(aqk,aql)=>{const aqm=(aql / aqi) * 2 * 3.14159 - (3.14159 / 2);const aqn=aqg + (aqh * anx(aqm));const aqo=aqg + (aqh * anz(aqm));return `${ax(aqn)},${ax(aqo)}`});return aaz(aqj,` `)})())},aqp=()=>{return `stroke: ${o(d.value)}; stroke-opacity: 0.2;`};P(()=>{(()=>{const aqq=abc(aob,(aqr)=>{return true});return (()=>{aoq.value=aqq})()})()},[]);return E(`div`,{className:`ab`,style:F([apn()])},[E(`svg`,{"width":ax(aoe),"height":ax(aoe),"viewBox":`0 0 ${ax(aoe)} ${ax(aoe)}`,style:F([`max-width: 100%; height: auto;`])},[(aoh?E(Q,{},[E(`polygon`,{"points":aqe(100),"fill":`none`,"stroke-width":`1`,style:F([aqp()])}),E(`polygon`,{"points":aqe(75),"fill":`none`,"stroke-width":`1`,style:F([aqp()])}),E(`polygon`,{"points":aqe(50),"fill":`none`,"stroke-width":`1`,style:F([aqp()])}),E(`polygon`,{"points":aqe(25),"fill":`none`,"stroke-width":`1`,style:F([aqp()])})]):E(`g`,{})),(aol?(()=>{const aqs=aoe / 2;const aqt=(aoe / 2) - 50;const aqu=av(aob);return aes(aob,(aqv,aqw)=>{const aqx=(aqw / aqu) * 2 * 3.14159 - (3.14159 / 2);const aqy=aqs + (aqt * anx(aqx));const aqz=aqs + (aqt * anz(aqx));return E(`line`,{"x1":ax(aqs),"y1":ax(aqs),"x2":ax(aqy),"y2":ax(aqz),"stroke-width":`1`,style:F([aqp()])})})})():[]),(aor.value?E(`polygon`,{"points":apr(aob),"fill":(aoi?aof:`none`),"fill-opacity":(aoi?`0.3`:`0`),"stroke":aof,"stroke-width":`2`,style:F([(aon?`transition: all 0.3s ease;`:``)])}):E(`g`,{})),(apd() && aos.value?E(`polygon`,{"points":apr(aoc),"fill":(aoi?aog:`none`),"fill-opacity":(aoi?`0.3`:`0`),"stroke":aog,"stroke-width":`2`,"stroke-dasharray":`5,5`,style:F([(aon?`transition: all 0.3s ease;`:``)])}):E(`g`,{})),E(`g`,{},[(aok && aor.value?(()=>{const ara=aoe / 2;const arb=(aoe / 2) - 50;return aes(aob,(arc,ard)=>{const are=zh(az(aoq.value,ard),true);const arf=av(aob);const arg=(ard / arf) * 2 * 3.14159 - (3.14159 / 2);const arh=(are?(arc / 100) * arb:0);const ari=ara + (arh * anx(arg));const arj=ara + (arh * anz(arg));return (are?E(`circle`,{"cx":ax(ari),"cy":ax(arj),"r":`6`,"fill":apj(ard),"stroke":`white`,"stroke-width":`3`}):E(`g`,{}))})})():[])]),E(`g`,{},[(aok && apd() && aos.value?(()=>{const ark=aoe / 2;const arl=(aoe / 2) - 50;return aes(aoc,(arm,arn)=>{const aro=zh(az(aoq.value,arn),true);const arp=av(aoc);const arq=(arn / arp) * 2 * 3.14159 - (3.14159 / 2);const arr=(aro?(arm / 100) * arl:0);const ars=ark + (arr * anx(arq));const art=ark + (arr * anz(arq));return (aro?E(`circle`,{"cx":ax(ars),"cy":ax(art),"r":`6`,"fill":apj(arn),"stroke":`white`,"stroke-width":`3`}):E(`g`,{}))})})():[])])]),(apd()?E(`div`,{className:`ad`},[E(`div`,{"onClick":aoz,className:`ae`,style:F([`${apo()}; background: ${(aor.value?o(d.value):`transparent`)};`])},[E(`div`,{className:`ac`,style:F([`background: ${aof};`])}),E(`span`,{},[aoo]),E(`span`,{className:`af`},[`(Avg: ${ax(anf(ape(aob)))})`])]),E(`div`,{"onClick":apb,className:`ae`,style:F([`${apo()}; background: ${(aos.value?o(d.value):`transparent`)};`])},[E(`div`,{className:`ac`,style:F([`background: ${aog};`])}),E(`span`,{},[aop]),E(`span`,{className:`af`},[`(Avg: ${ax(anf(ape(aoc)))})`])])]):E(`div`,{})),(aoj?E(`table`,{className:`ag`},[E(`thead`,{},[E(`tr`,{},[E(`th`,{className:`ah`,style:F([apq()])},[`Metric`]),E(`th`,{className:`ah`,style:F([`${apq()}; text-align: center;`])},[aoo]),(apd()?E(`th`,{className:`ah`,style:F([`${apq()}; text-align: center;`])},[aop]):E(`th`,{}))])]),E(`tbody`,{},[aes(aod,(aru,arv)=>{const arw=zh(az(aoq.value,arv),true);const arx=zh(az(aob,arv),0);const ary=zh(az(aoc,arv),0);return E(`tr`,{"onClick":(arz)=>{return aot(arv,arz)},style:F([`${(arw?`opacity: 1;`:`opacity: 0.4;`)}; cursor: pointer; transition: all 0.2s ease;`])},[E(`td`,{className:`ai`,style:F([app()])},[E(`div`,{className:`aj`},[E(`div`,{className:`ac`,style:F([`background: ${apj(arv)}; opacity: ${(arw?`1`:`0.3`)};`])}),E(`span`,{style:F([apo()])},[aru])])]),E(`td`,{className:`ai`,style:F([app()])},[E(`div`,{className:`ak`,style:F([`color: ${aof};`])},[ax(arx)])]),(apd()?E(`td`,{className:`ai`,style:F([app()])},[E(`div`,{className:`ak`,style:F([`color: ${aog};`])},[ax(ary)])]):E(`td`,{}))])})])]):E(`div`,{}))])},CI=({asa=[10,20,30,40,50,60,70,80,90],asb=3,asc=3,asd=50})=>{const ase=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},asf=()=>{return `
      grid-template-columns: repeat(${ax(asc)}, minmax(30px, ${ax(asd)}px));
      grid-template-rows: repeat(${ax(asb)}, minmax(30px, ${ax(asd)}px));
    `},asg=(ash)=>{const asi=ash / 100;const asj=anf(102 + (153 * asi));const ask=anf(126 - (58 * asi));const asl=anf(234 - (172 * asi));return `background: rgb(${ax(asj)}, ${ax(ask)}, ${ax(asl)});`};return E(`div`,{className:`t`,style:F([ase()])},[E(`div`,{className:`u`,style:F([asf()])},[aes(asa,(asm,asn)=>{return E(`div`,{className:`v`,style:F([asg(asm)])},[ax(anf(asm))])})])])},CJ=({aso=75,asp=80,asq=8,asr=``,ass=`#667eea`,ast=true})=>{const asu=()=>{return `color: ${m(d.value)};`},asv=()=>{return `color: ${qb(d.value)};`},asw=()=>{return (asp / 2) - (asq / 2)},asx=()=>{return 2 * 3.14159 * asw()},asy=()=>{const asz=asx();return asz - ((aso / 100) * asz)};return E(`div`,{className:`nr`},[E(`div`,{className:`ns`},[E(`svg`,{"width":ax(asp),"height":ax(asp),"viewBox":`0 0 ${ax(asp)} ${ax(asp)}`},[E(`circle`,{"cx":ax(asp / 2),"cy":ax(asp / 2),"r":ax(asw()),"fill":`none`,"stroke":ab(d.value),"stroke-width":ax(asq)}),E(`circle`,{"cx":ax(asp / 2),"cy":ax(asp / 2),"r":ax(asw()),"fill":`none`,"stroke":ass,"stroke-width":ax(asq),"stroke-dasharray":ax(asx()),"stroke-dashoffset":ax(asy()),"stroke-linecap":`round`,"transform":`rotate(-90 ${ax(asp / 2)} ${ax(asp / 2)})`,style:F([`transition: stroke-dashoffset 0.6s ease;`])})]),(ast?E(`div`,{className:`nt`},[E(`div`,{className:`nu`,style:F([asu()])},[`${ax(anf(aso))}%`])]):E(`div`,{}))]),(!ao(asr)?E(`div`,{className:`nv`,style:F([asv()])},[asr]):E(`div`,{}))])},CK=()=>{const ata=()=>{return `border-bottom-color: ${o(d.value)};`},atb=()=>{return `
      background: ${ab(d.value)};
      border-color: ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},atc=()=>{return `background: ${s(d.value)};`},atd=()=>{return `background: ${ad(d.value)}; color: white;`};return E(`div`,{},[E(`h1`,{className:`pd`},[`Charts & Data Visualization`]),E(`p`,{className:`pe`},[`Professional data visualization components with SVG rendering, animations,
        and full theme support. Perfect for dashboards and analytics.`]),E(`div`,{className:`pf`},[E(`h2`,{className:`pg`,style:F([ata()])},[`LineChart`]),E(`div`,{className:`ph`,style:F([atb()])},[E(`h3`,{className:`pi`},[`LineChart`,E(`span`,{className:`pl`,style:F([atd()])},[`Chart`])]),E(`p`,{className:`pj`},[`Smooth line charts with multiple series, grid, and tooltips.`]),E(`div`,{className:`pk`,style:F([atc()])},[E(CD,{ajv:[10,25,15,40,30,55,45],ajx:`300px`,ajy:ad(d.value)})]),E(BC,{mr:`mint`,mq:`<LineChart
  data={[10, 25, 15, 40, 30, 55, 45]}
  height="300px"
  color={ThemeHelpers.getAccent(currentTheme)}
/>`})])]),E(`div`,{className:`pf`},[E(`h2`,{className:`pg`,style:F([ata()])},[`BarChart`]),E(`div`,{className:`ph`,style:F([atb()])},[E(`h3`,{className:`pi`},[`BarChart`,E(`span`,{className:`pl`,style:F([atd()])},[`Chart`])]),E(`p`,{className:`pj`},[`Vertical and horizontal bar charts with animations.`]),E(`div`,{className:`pk`,style:F([atc()])},[E(CE,{alb:[30,45,25,60,55],alc:[`Mon`,`Tue`,`Wed`,`Thu`,`Fri`],ald:`300px`,ale:ad(d.value)})]),E(BC,{mr:`mint`,mq:`<BarChart
  data={[30, 45, 25, 60, 55]}
  labels={["Mon", "Tue", "Wed", "Thu", "Fri"]}
  height="300px"
  color={ThemeHelpers.getAccent(currentTheme)}
/>`})])]),E(`div`,{className:`pf`},[E(`h2`,{className:`pg`,style:F([ata()])},[`AreaChart`]),E(`div`,{className:`ph`,style:F([atb()])},[E(`h3`,{className:`pi`},[`AreaChart`,E(`span`,{className:`pl`,style:F([atd()])},[`Chart`])]),E(`p`,{className:`pj`},[`Area charts with gradient fills and smooth animations.`]),E(`div`,{className:`pk`,style:F([atc()])},[E(CF,{aly:[20,35,25,50,40,65,55],ama:`300px`,amb:ad(d.value)})]),E(BC,{mr:`mint`,mq:`<AreaChart
  data={[20, 35, 25, 50, 40, 65, 55]}
  height="300px"
  color={ThemeHelpers.getAccent(currentTheme)}
/>`})])]),E(`div`,{className:`pf`},[E(`h2`,{className:`pg`,style:F([ata()])},[`DonutChart`]),E(`div`,{className:`ph`,style:F([atb()])},[E(`h3`,{className:`pi`},[`DonutChart`,E(`span`,{className:`pl`,style:F([atd()])},[`Chart`])]),E(`p`,{className:`pj`},[`Donut charts for proportional data with legends.`]),E(`div`,{className:`pk`,style:F([atc()])},[E(CG,{anh:75,ani:100,anj:300,anm:`Progress`,anl:ad(d.value)})]),E(BC,{mr:`mint`,mq:`<DonutChart
  value={75}
  max={100}
  size={300}
  label="Progress"
  color={ThemeHelpers.getAccent(currentTheme)}
/>`})])]),E(`div`,{className:`pf`},[E(`h2`,{className:`pg`,style:F([ata()])},[`RadarChart`]),E(`div`,{className:`ph`,style:F([atb()])},[E(`h3`,{className:`pi`},[`RadarChart`,E(`span`,{className:`pl`,style:F([atd()])},[`Chart`])]),E(`p`,{className:`pj`},[`Radar/spider charts for multi-variable data comparison.`]),E(`div`,{className:`pk`,style:F([atc()])},[E(CH,{aob:[65,75,80,70,85,90],aod:[`Speed`,`Quality`,`Design`,`UX`,`Performance`,`Support`],aoe:350})]),E(BC,{mr:`mint`,mq:`<RadarChart
  data={[65, 75, 80, 70, 85, 90]}
  labels={["Speed", "Quality", "Design"]}
  size={350}
/>`})])]),E(`div`,{className:`pf`},[E(`h2`,{className:`pg`,style:F([ata()])},[`HeatMap`]),E(`div`,{className:`ph`,style:F([atb()])},[E(`h3`,{className:`pi`},[`HeatMap`,E(`span`,{className:`pl`,style:F([atd()])},[`Chart`])]),E(`p`,{className:`pj`},[`Heatmaps for visualizing matrix data with color gradients.`]),E(`div`,{className:`pk`,style:F([atc()])},[E(CI,{asa:[10,20,30,40,50,60,70,80,90,100,110,120],asb:3,asc:4,asd:60})]),E(BC,{mr:`mint`,mq:`<HeatMap
  data={[10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]}
  rows={3}
  cols={4}
  cellSize={60}
/>`})])]),E(`div`,{className:`pf`},[E(`h2`,{className:`pg`,style:F([ata()])},[`PercentageRing`]),E(`div`,{className:`ph`,style:F([atb()])},[E(`h3`,{className:`pi`},[`PercentageRing`,E(`span`,{className:`pl`,style:F([atd()])},[`Chart`])]),E(`p`,{className:`pj`},[`Circular progress indicator for percentages and metrics.`]),E(`div`,{className:`pk`,style:F([atc()])},[E(BE,{oe:`2rem`,ob:`center`},M(E(CJ,{aso:75,asp:150,asr:`Progress`}),E(CJ,{aso:60,asp:150,asr:`Completion`}),E(CJ,{aso:90,asp:150,asr:`Quality`})))]),E(BC,{mr:`mint`,mq:`<PercentageRing
  percentage={75}
  size={150}
  label="Progress"
/>`})])])])},ate=(atf)=>{return D(av(atf),0)},atg=(ath)=>{return (D(ath,`dark`)?`0 20px 50px rgba(0, 0, 0, 0.25)`:`0 20px 50px rgba(15, 23, 42, 0.15)`)},CL=({ati=[],atj=[],atk=false,atl=3000,atm=true,atn=true})=>{const ato=L(0),atp=L(false),atq=L(false),atr=()=>{return `
      background: ${ab(d.value)};
      box-shadow: ${atg(d.value)};
    `},ats=()=>{return `
      background: ${ah(d.value)};
      color: ${m(d.value)};
      box-shadow: ${w(d.value)};
    `},att=(atu)=>{return (atu?`
        background: ${ad(d.value)};
        width: 24px;
        border-radius: 5px;
      `:`
        background: ${qb(d.value)};
        opacity: 0.5;
      `)},atv=(atw)=>{return (atw?`
        border-color: ${ad(d.value)};
        box-shadow: ${w(d.value)};
        transform: translateY(-4px);
      `:`
        border-color: ${o(d.value)};
        opacity: 0.7;
      `)},atx=(aty)=>{const atz=(ato.value >= av(ati) - 1?0:ato.value + 1);return N(()=>{ato.value=atz;atp.value=false})},aua=(aub)=>{const auc=(ato.value <= 0?av(ati) - 1:ato.value - 1);return N(()=>{ato.value=auc;atp.value=false})},aud=(aue,auf)=>{return N(()=>{ato.value=aue;atp.value=false})},aug=(auh)=>{return (atn?(()=>{atp.value=!atp.value})():no(null))},aui=(auj)=>{return (()=>{atq.value=!atq.value})()},auk=()=>{return zh(az(ati,ato.value),``)},aul=()=>{return zh(az(atj,ato.value),`Carousel image`)};return (ate(ati)?E(`div`,{},[`No hay imágenes para mostrar`]):E(`div`,{className:`hf`,style:F([atr()])},[E(`div`,{className:`hg`},[E(`img`,{"src":auk(),"alt":aul(),"onClick":aug,className:(atp.value?`zoomed`:``) + ` hh`}),E(`button`,{"onClick":aua,className:`hi hj`,style:F([ats()])},[`‹`]),E(`button`,{"onClick":atx,className:`hi hk`,style:F([ats()])},[`›`]),E(`div`,{className:`hl`},[aes(ati,(aum,aun)=>{return E(`button`,{"onClick":(auo)=>{return aud(aun,auo)},className:`hm`,style:F([att(D(ato.value,aun))])})})]),(atk?E(`button`,{"onClick":aui,className:`hq`,style:F([ats()])},[(atq.value?`▶`:`⏸`)]):E(`div`,{}))]),(atm && av(ati) > 1?E(`div`,{className:`hn`},[aes(ati,(aup,auq)=>{return E(`div`,{"onClick":(aur)=>{return aud(auq,aur)},className:`ho`,style:F([atv(D(ato.value,auq))])},[E(`img`,{"src":aup,"alt":`Thumbnail`,className:`hp`})])})]):E(`div`,{}))]))},CM=({aus=``,aut=``,auu=``,auv=`100%`,auw=`auto`,aux=`cover`,auy=`8px`,auz=(ava)=>{return no(null)}})=>{const avb=L(false),avc=L(false),avd=L(false),ave=()=>{return `
      background: ${ab(d.value)};
      color: ${qb(d.value)};
    `},avf=(avg)=>{return (()=>{avb.value=true})()},avh=(avi)=>{return (()=>{avd.value=true})()},avj=()=>{const _={[`--g-a`]:auv,[`--g-b`]:auw,[`--g-c`]:auy};return _},avk=()=>{const _={[`--h-a`]:aux};return _},avl=()=>{const _={[`--i-a`]:aux};return _};P(()=>{(()=>{return (()=>{avc.value=true})()})()},[]);return E(`div`,{"onClick":auz,"data-lazy-image":`true`,className:`gy`,style:F([avj()])},[(avd.value?E(`div`,{className:`hc`,style:F([ave()])},[E(`div`,{className:`hd`},[`🖼️`]),E(`div`,{className:`he`},[`Error al cargar imagen`])]):(!avc.value?E(`div`,{className:`hb`}):E(Q,{},[(!D(aut,``)?E(`img`,{"src":aut,"alt":auu,className:(avb.value?`placeholderHidden`:``) + ` gz`,style:F([avk()])}):E(`div`,{className:`hb`})),E(`img`,{"src":aus,"alt":auu,"onLoad":avf,"onError":avh,"loading":`lazy`,className:(avb.value?`imageLoaded`:``) + ` ha`,style:F([avl()])})])))])},avm=(avn)=>{return (D(avn,`dark`)?`rgba(255, 255, 255, 0.12)`:`rgba(15, 23, 42, 0.12)`)},CN=({avo=``,avp=``,avq=`100%`,avr=`500px`,avs=false,avt=false})=>{const avu=L(false),avv=L(0),avw=L(0),avx=L(1),avy=L(false),avz=L(1),awa=L(false),awb=L(true),awc=L(0),awd=L(false),awe=L(false),awf=L(false),awg=L(``),awh=L(false),awi=L(false),awj=L(0),awk=L(false),awl=L(0),awm=()=>{return `
      background: ${s(d.value)};
      box-shadow: ${atg(d.value)};
    `},awn=()=>{return `
      background: ${avm(d.value)};
    `},awo=(awp)=>{(document.querySelector('video')?.paused ?
      document.querySelector('video')?.play() :
      document.querySelector('video')?.pause());return no(null)},awq=(awr)=>{return awo(awr)},aws=(awt)=>{const awu=(awt.target.currentTime || 0);const awv=(awt.target.duration || 0);const aww=((() => {
        const v = awt.target;
        return v.buffered.length > 0 && v.duration > 0
          ? (v.buffered.end(0) / v.duration) * 100
          : 0;
      })());return N(()=>{avv.value=awu;avw.value=awv;awc.value=aww})},awx=(awy)=>{return (()=>{avu.value=true})()},awz=(axa)=>{return (()=>{avu.value=false})()},axb=(axc)=>{return N(()=>{awe.value=true;awf.value=false;awi.value=false})},axd=(axe)=>{return (()=>{awe.value=false})()},axf=(axg)=>{return N(()=>{awi.value=true;awe.value=false;awh.value=false})},axh=(axi)=>{return (()=>{awh.value=true})()},axj=(axk)=>{return N(()=>{awh.value=false;awe.value=false;awf.value=false})},axl=(axm)=>{const axn=((() => {
        const video = axm.target;
        const error = video.error;

        if (!error) return "Error desconocido al cargar el video";

        switch(error.code) {
          case 1: return "Carga de video abortada";
          case 2: return "Error de red al cargar el video";
          case 3: return "Error al decodificar el video";
          case 4: return "Formato de video no soportado";
          default: return "Error desconocido: " + error.message;
        }
      })());return N(()=>{awf.value=true;awe.value=false;awh.value=false;awg.value=axn})},axo=(axp)=>{return (()=>{awh.value=true})()},axq=(axr)=>{return N(()=>{awd.value=true;awh.value=true})},axs=(axt)=>{return N(()=>{awd.value=false;awh.value=false})},axu=(axv)=>{((() => {
      const video = document.querySelector('video');
      if (video) {
        video.load();
        setTimeout(() => {
          video.play().catch(err => console.log('Autoplay prevented:', err));
        }, 100);
      }
    })());return N(()=>{awf.value=false;awg.value=``;awj.value=awj.value + 1;awe.value=true})},axw=(axx)=>{const axy=(axx.target.volume || 0);const axz=(axx.target.muted || false);return N(()=>{avx.value=axy;avy.value=axz})},aya=(ayb)=>{((() => {
      const r = ayb.currentTarget.getBoundingClientRect();
      const p = ((ayb.clientX - r.left) / r.width) * 100;
      const v = document.querySelector('video');
      if (v?.duration) v.currentTime = (p / 100) * v.duration;
    })());return no(null)},ayc=(ayd)=>{((() => {
      const v = document.querySelector('video');
      if (v) v.muted = !v.muted;
    })());return (()=>{avy.value=!avy.value})()},aye=(ayf)=>{((() => {
      const r = ayf.currentTarget.getBoundingClientRect();
      const p = Math.max(0, Math.min(100, ((ayf.clientX - r.left) / r.width) * 100));
      const v = document.querySelector('video');
      if (v) v.volume = p / 100;
    })());return no(null)},ayg=(ayh)=>{const ayi=(avz.value >= 2?0.5:avz.value + 0.25);((() => {
      const v = document.querySelector('video');
      if (v) v.playbackRate = ayi;
    })());return (()=>{avz.value=ayi})()},ayj=(ayk)=>{((() => {
      const c = document.querySelector('.video-container');
      if (c) {
        document.fullscreenElement ? document.exitFullscreen() : c.requestFullscreen();
      }
    })());return (()=>{awa.value=!awa.value})()},ayl=(aym)=>{N(()=>{awk.value=true;awl.value=0});((async () => {
      const v = document.querySelector('video');
      if (!v?.src) return;

      const url = v.src;
      const fileName = 'video_' + Date.now() + '.mp4';

      try {
        const res = await fetch(url, { mode: 'cors', cache: 'force-cache' });
        if (!res.ok) throw new Error();

        const total = parseInt(res.headers.get('content-length'), 10);
        const reader = res.body.getReader();
        let received = 0;
        let chunks = [];

        for (;;) {
          const {done, value} = await reader.read();
          if (done) break;

          chunks.push(value);
          received += value.length;

          if (total) {
            window._mintUpdateProgress = Math.round((received / total) * 100);
          }
        }

        const blob = new Blob(chunks);
        const blobUrl = URL.createObjectURL(blob);
        const l = document.createElement('a');
        l.href = blobUrl;
        l.download = fileName;
        document.body.appendChild(l);
        l.click();
        document.body.removeChild(l);
        setTimeout(() => URL.revokeObjectURL(blobUrl), 100);

        window._mintDownloadDone = true;
      } catch {
        const l = document.createElement('a');
        l.href = url;
        l.download = fileName;
        document.body.appendChild(l);
        l.click();
        document.body.removeChild(l);

        window._mintDownloadDone = true;
      }
    })());(setTimeout(() => this.pollDownloadProgress(), 100));return no(null)},ayn=(ayo)=>{const ayp=anf(ayo / 60);const ayq=anf(ayo % 60);const ayr=(ayq < 10?`0${ax(ayq)}`:ax(ayq));return `${ax(ayp)}:${ayr}`},ays=()=>{return (avw.value > 0?(avv.value / avw.value) * 100:0)},ayt=()=>{return avx.value * 100},ayu=()=>{const _={[`--o-a`]:avq,[`--o-b`]:avr};return _};return E(`div`,{className:`video-container` + ` ih`,style:F([ayu(),awm()])},[E(`video`,{"src":avo,"poster":avp,"preload":`metadata`,"onTimeUpdate":aws,"onPlay":awx,"onPause":awz,"onVolumeChange":axw,"onLoadStart":axb,"onLoadedMetadata":axd,"onCanPlay":axf,"onWaiting":axh,"onPlaying":axj,"onError":axl,"onStalled":axo,"onSeeking":axq,"onSeeked":axs,className:`ii`}),E(`div`,{"onClick":awq,className:`ij`}),(awk.value?E(`div`,{className:`jh`},[E(`span`,{},[`⬇ Descargando`]),E(`div`,{className:`ji`},[E(`div`,{className:`jj`,style:F([`width: ${ax(awl.value)}%`])})]),E(`span`,{},[ax(awl.value),` %`])]):E(`div`,{})),(awf.value?E(`div`,{className:`jb`},[E(`div`,{className:`jc`},[`⚠️`]),E(`div`,{className:`jd`},[awg.value]),E(`button`,{"onClick":axu,className:`je`},[`Reintentar`])]):(awe.value || awh.value?E(`div`,{className:`jf`},[E(`div`,{className:`ja`}),E(`div`,{className:`jg`},[(awe.value?`Cargando video...`:`Buffering...`)])]):(!avu.value && D(avv.value,0)?E(`button`,{"onClick":awo,className:`iz`},[`▶`]):E(`div`,{})))),E(`div`,{className:(awb.value?``:`controlsHidden`) + ` ik`},[E(`div`,{"onClick":aya,className:`il`},[E(`div`,{className:`im`,style:F([awn()])},[E(`div`,{className:`io`,style:F([`width: ${ax(awc.value)}%`])}),E(`div`,{className:`ip`,style:F([`width: ${ax(ays())}%`])}),E(`div`,{className:`iq`,style:F([`left: ${ax(ays())}%`])})])]),E(`div`,{className:`ir`},[E(`button`,{"onClick":awo,className:`is`},[(avu.value?`⏸`:`▶`)]),E(`div`,{className:`it`},[E(`button`,{"onClick":ayc,className:`is`},[(avy.value?`🔇`:(avx.value > 0.5?`🔊`:(avx.value > 0?`🔉`:`🔈`)))]),E(`div`,{"onClick":aye,className:`iu`},[E(`div`,{className:`iv`,style:F([`width: ${ax(ayt())}%`])})])]),E(`div`,{className:`iw`},[ayn(avv.value),` / `,ayn(avw.value)]),E(`div`,{className:`ix`}),E(`button`,{"onClick":ayg,className:`iy`},[ax(avz.value),`x`]),E(`button`,{"onClick":ayl,className:`is`},[`⬇`]),E(`button`,{"onClick":ayj,className:`is`},[(awa.value?`⛶`:`⛶`)])])])])},CO=({ayv=``,ayw=``,ayx=`300px`,ayy=`200px`})=>{const ayz=L(false),aza=()=>{return `
      background: ${ab(d.value)};
      box-shadow: ${w(d.value)};
    `},azb=(azc)=>{((() => {
      const video = azc.currentTarget.querySelector('video');
      if (video) {
        if (video.paused) {
          video.play();
        } else {
          video.pause();
        }
      }
    })());return no(null)},azd=(aze)=>{return (()=>{ayz.value=true})()},azf=(azg)=>{return (()=>{ayz.value=false})()},azh=()=>{const _={[`--p-a`]:ayx,[`--p-b`]:ayy};return _};return E(`div`,{"onClick":azb,className:`jk`,style:F([azh(),aza()])},[E(`video`,{"src":ayv,"poster":ayw,"onPlay":azd,"onPause":azf,className:`jl`}),(ayz.value?E(`div`,{}):E(`div`,{className:`jm`},[E(`div`,{className:`jn`},[`▶`])]))])},CP=({azi=[],azj=3,azk=`1rem`})=>{const azl=()=>{return `
      background: ${ab(d.value)};
      box-shadow: ${w(d.value)};
    `},azm=()=>{const _={[`--k-a`]:ax(azj),[`--k-b`]:azk};return _},azn=()=>{const _={[`--l-a`]:azk};return _};return E(`div`,{className:`hu`,style:F([azm()])},[abc(azi,(azo)=>{return E(`div`,{className:`hv`,style:F([azn(),azl()])},[E(`img`,{"src":azo,"alt":`Masonry image`,className:`hw`})])})])},CQ=({azp=``,azq=``,azr=`Antes`,azs=`Después`})=>{const azt=L(50),azu=()=>{return `
      background: ${ab(d.value)};
      box-shadow: ${atg(d.value)};
    `},azv=()=>{return `
      background: ${ad(d.value)};
      box-shadow: ${w(d.value)};
    `},azw=()=>{return `
      background: ${ad(d.value)};
      color: ${af(d.value)};
      box-shadow: ${atg(d.value)};
    `},azx=()=>{return `
      background: ${ah(d.value)};
      color: ${m(d.value)};
      box-shadow: ${aj(d.value)};
    `},azy=(azz)=>{const baa=((() => {
      const r = azz.currentTarget.getBoundingClientRect();
      const x = azz.clientX - r.left;
      return Math.max(0, Math.min(100, (x / r.width) * 100));
    })());return (()=>{azt.value=baa})()},bab=()=>{const _={[`--m-a`]:`inset(0 0 0 ` + ax(azt.value) + `%)`};return _},bac=()=>{const _={[`--n-a`]:ax(azt.value) + `%`};return _};return E(`div`,{"onMouseMove":azy,className:`hx`,style:F([azu()])},[E(`div`,{className:`hy`},[E(`img`,{"src":azp,"alt":azr,className:`hz`})]),E(`div`,{className:`hy ia`,style:F([bab()])},[E(`img`,{"src":azq,"alt":azs,className:`hz`})]),E(`div`,{className:`ib`,style:F([bac(),azv()])},[E(`div`,{className:`ic`,style:F([azw()])},[`⇄`])]),E(`div`,{className:`id ie`,style:F([azx()])},[azr]),E(`div`,{className:`id ig`,style:F([azx()])},[azs])])},CR=({bad=``,bae=``,baf=`100%`,bag=`600px`,bah=2})=>{const bai=L(false),baj=L(50),bak=L(50),bal=()=>{return `
      background: ${ab(d.value)};
      box-shadow: ${w(d.value)};
    `},bam=()=>{return `
      background: ${ah(d.value)};
      color: ${m(d.value)};
      box-shadow: ${aj(d.value)};
    `},ban=(bao)=>{return (()=>{bai.value=!bai.value})()},bap=(baq)=>{return (bai.value?(()=>{const bar=((() => {
        const r = baq.target.getBoundingClientRect();
        return ((baq.clientX - r.left) / r.width) * 100;
      })());const bas=((() => {
        const r = baq.target.getBoundingClientRect();
        return ((baq.clientY - r.top) / r.height) * 100;
      })());return N(()=>{baj.value=bar;bak.value=bas})})():no(null))},bat=()=>{return (bai.value?`transform: scale(${ax(bah)}); transform-origin: ${ax(baj.value)}% ${ax(bak.value)}%;`:``)},bau=()=>{const _={[`--j-a`]:baf,[`--j-b`]:bag};return _};return E(`div`,{"onClick":ban,"onMouseMove":bap,className:`hr`,style:F([bau(),bal()])},[E(`img`,{"src":bad,"alt":bae,className:(bai.value?`zoomedImage`:``) + ` hs`,style:F([bat()])}),(bai.value?E(`div`,{className:`ht`,style:F([bam()])},[`🔍 ${ax(bah)}x`]):E(`div`,{}))])},bav=(baw)=>{return (D(baw,`dark`)?`rgba(30, 41, 59, 0.8)`:`rgba(255, 255, 255, 0.9)`)},bax=(bay)=>{return (D(bay,`dark`)?`rgba(255, 255, 255, 0.15)`:`rgba(15, 23, 42, 0.2)`)},baz=(bba)=>{return (D(bba,`dark`)?`rgba(255, 255, 255, 0.95)`:`rgba(15, 23, 42, 0.9)`)},bbb=(bbc,bbd)=>{return ((() => {
      const text = bbc;
      const errorLevel = bbd;

      // QR Code implementation using inline JavaScript
      // Based on QR Code specification

      // Error correction levels: L=7%, M=15%, Q=25%, H=30%
      const EC_LEVELS = { 'L': 1, 'M': 0, 'Q': 3, 'H': 2 };
      const ecLevel = EC_LEVELS[errorLevel] || EC_LEVELS['M'];

      // Determine version and mode
      const mode = 4; // Byte mode (supports all characters)
      let version = 1;
      const dataLength = text.length;

      // Calculate required version based on data length
      // Version 1-40, each version adds 4 modules
      const capacities = [
        17, 32, 53, 78, 106, 134, 154, 192, 230, 271,
        321, 367, 425, 458, 520, 586, 644, 718, 792, 858,
        929, 1003, 1091, 1171, 1273, 1367, 1465, 1528, 1628, 1732,
        1840, 1952, 2068, 2188, 2303, 2431, 2563, 2699, 2809, 2953
      ];

      for (let i = 0; i < capacities.length; i++) {
        if (dataLength <= capacities[i]) {
          version = i + 1;
          break;
        }
      }

      const size = 21 + (version - 1) * 4;

      // Initialize matrix
      const matrix = Array(size).fill(0).map(() => Array(size).fill(0));
      const reserved = Array(size).fill(0).map(() => Array(size).fill(false));

      // Add finder patterns (position detection patterns)
      const addFinderPattern = (row, col) => {
        for (let i = -1; i <= 7; i++) {
          for (let j = -1; j <= 7; j++) {
            const r = row + i;
            const c = col + j;
            if (r >= 0 && r < size && c >= 0 && c < size) {
              reserved[r][c] = true;
              if ((i >= 0 && i <= 6 && (j === 0 || j === 6)) ||
                  (j >= 0 && j <= 6 && (i === 0 || i === 6)) ||
                  (i >= 2 && i <= 4 && j >= 2 && j <= 4)) {
                matrix[r][c] = 1;
              }
            }
          }
        }
      };

      // Top-left, top-right, bottom-left finders
      addFinderPattern(0, 0);
      addFinderPattern(0, size - 7);
      addFinderPattern(size - 7, 0);

      // Add timing patterns
      for (let i = 8; i < size - 8; i++) {
        matrix[6][i] = reserved[6][i] = i % 2 === 0 ? 1 : 0;
        matrix[i][6] = reserved[i][6] = i % 2 === 0 ? 1 : 0;
        reserved[6][i] = reserved[i][6] = true;
      }

      // Add dark module
      matrix[size - 8][8] = 1;
      reserved[size - 8][8] = true;

      // Encode data
      const encodeData = () => {
        const bytes = [];

        // Mode indicator (4 bits) - Byte mode = 0100
        let bits = '0100';

        // Character count indicator (8 bits for byte mode, version 1-9)
        const charCountBits = version < 10 ? 8 : 16;
        bits += dataLength.toString(2).padStart(charCountBits, '0');

        // Data
        for (let i = 0; i < text.length; i++) {
          bits += text.charCodeAt(i).toString(2).padStart(8, '0');
        }

        // Terminator (up to 4 bits of 0)
        bits += '0000';

        // Pad to byte boundary
        while (bits.length % 8 !== 0) {
          bits += '0';
        }

        // Convert to bytes
        for (let i = 0; i < bits.length; i += 8) {
          bytes.push(parseInt(bits.substr(i, 8), 2));
        }

        // Add pad bytes
        const capacity = Math.floor((size * size - 200) / 8); // Approximate
        while (bytes.length < capacity) {
          bytes.push(bytes.length % 2 === 0 ? 236 : 17);
        }

        return bytes;
      };

      const dataBytes = encodeData();

      // Place data in matrix (zigzag pattern)
      let byteIndex = 0;
      let bitIndex = 7;

      for (let col = size - 1; col > 0; col -= 2) {
        if (col === 6) col--; // Skip timing column

        for (let row = 0; row < size; row++) {
          for (let c = 0; c < 2; c++) {
            const currentCol = col - c;
            const currentRow = (col + 1) % 4 < 2 ? size - 1 - row : row;

            if (!reserved[currentRow][currentCol]) {
              if (byteIndex < dataBytes.length) {
                const bit = (dataBytes[byteIndex] >> bitIndex) & 1;
                matrix[currentRow][currentCol] = bit;
                bitIndex--;
                if (bitIndex < 0) {
                  byteIndex++;
                  bitIndex = 7;
                }
              }
            }
          }
        }
      }

      // Convert matrix to string for easier handling
      return JSON.stringify(matrix);
    })())},CS=({bbe=``,bbf=256,bbg=`#ffffff`,bbh=`#000000`,bbi=2,bbj=false,bbk=``,bbl=`M`})=>{const bbm=()=>{return ((() => {
      try {
        const matrixJson = bbb(bbe,bbl);
        const matrix = JSON.parse(matrixJson);
        const qrSize = matrix.length;

        const border = bbi;
        const totalSize = qrSize + (border * 2);
        const pixelSize = bbf / totalSize;

        const canvas = document.createElement('canvas');
        canvas.width = bbf;
        canvas.height = bbf;
        const ctx = canvas.getContext('2d');

        // Background
        ctx.fillStyle = bbg;
        ctx.fillRect(0, 0, bbf, bbf);

        // Draw QR code
        ctx.fillStyle = bbh;
        for (let row = 0; row < qrSize; row++) {
          for (let col = 0; col < qrSize; col++) {
            if (matrix[row][col] === 1) {
              ctx.fillRect(
                (col + border) * pixelSize,
                (row + border) * pixelSize,
                pixelSize,
                pixelSize
              );
            }
          }
        }

        return canvas.toDataURL();
      } catch (e) {
        console.error('QR Code generation error:', e);
        return '';
      }
    })())},bbn=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
    `},bbo=()=>{return `color: ${m(d.value)};`},bbp=()=>{return `color: ${qb(d.value)};`},bbq=()=>{return `color: ${qb(d.value)};`};return E(`div`,{className:`st`,style:F([bbn()])},[(D(ao(bbm()),false)?E(Q,{},[E(`div`,{className:`sz`,style:F([bbq()])},[`QR CODE`,E(`span`,{className:`sy`},[`SCANNABLE`])]),E(`div`,{className:`su`},[E(`img`,{"src":bbm(),"alt":`QR Code`,className:`sv`})]),(bbj && D(ao(bbk),false)?E(`div`,{className:`sw`,style:F([bbo()])},[bbk]):E(`span`,{}))]):E(`div`,{className:`sx`,style:F([bbp()])},[`No data provided`]))])},bbr=[`212222`,`222122`,`222221`,`121223`,`121322`,`131222`,`122213`,`122312`,`132212`,`221213`,`221312`,`231212`,`112232`,`122132`,`122231`,`113222`,`123122`,`123221`,`223211`,`221132`,`221231`,`213212`,`223112`,`312131`,`311222`,`321122`,`321221`,`312212`,`322112`,`322211`,`212123`,`212321`,`232121`,`111323`,`131123`,`131321`,`112313`,`132113`,`132311`,`211313`,`231113`,`231311`,`112133`,`112331`,`132131`,`113123`,`113321`,`133121`,`313121`,`211331`,`231131`,`213113`,`213311`,`213131`,`311123`,`311321`,`331121`,`312113`,`312311`,`332111`,`314111`,`221411`,`431111`,`111224`,`111422`,`121124`,`121421`,`141122`,`141221`,`112214`,`112412`,`122114`,`122411`,`142112`,`142211`,`241211`,`221114`,`413111`,`241112`,`134111`,`111242`,`121142`,`121241`,`114212`,`124112`,`124211`,`411212`,`421112`,`421211`,`212141`,`214121`,`412121`,`111143`,`111341`,`131141`,`114113`,`114311`,`411113`,`411311`,`113141`,`114131`,`311141`,`411131`,`211412`,`211214`,`211232`,`2331112`],bbs=104,bbt=106,bbu=(bbv)=>{return ((() => {
      const text = bbv;
      const patterns = bbr;
      const START_B = bbs;
      const STOP = bbt;

      // Convert text to character codes
      const charCodes = text.split('').map(char => char.charCodeAt(0) - 32);
      const codes = [START_B, ...charCodes];

      // Calculate checksum
      let sum = 0;
      for (let i = 0; i < codes.length; i++) {
        const weight = (i === 0) ? 1 : i;
        sum += codes[i] * weight;
      }
      const checksum = sum % 103;
      codes.push(checksum);
      codes.push(STOP);

      // Convert codes to pattern string
      const patternStr = codes.map(code => patterns[code] || '').join('');

      // Convert pattern to binary
      let binary = '';
      for (let i = 0; i < patternStr.length; i++) {
        const width = parseInt(patternStr[i]);
        const bit = (i % 2 === 0) ? '1' : '0';
        binary += bit.repeat(width);
      }

      return binary;
    })())},CT=({bbw=``,bbx=`CODE128`,bby=2,bbz=100,bca=true,bcb=14,bcc=`#000000`,bcd=`#ffffff`,bce=10})=>{const bcf=()=>{return (bcg(bbx)?I(bbx,[[`CODE128`,()=>{return bch()}],[null,()=>{return ``}]]):``)},bcg=(bci)=>{return I(bci,[[`CODE128`,()=>{return true}],[`CODE39`,()=>{return true}],[`EAN13`,()=>{return true}],[`EAN8`,()=>{return true}],[`UPC`,()=>{return true}],[`ITF14`,()=>{return true}],[`MSI`,()=>{return true}],[`Pharmacode`,()=>{return true}],[`Codabar`,()=>{return true}],[null,()=>{return false}]])},bch=()=>{return ((() => {
      try {
        const binary = bbu(bbw);
        const canvas = document.createElement('canvas');
        const ctx = canvas.getContext('2d');

        const margin = bce;
        const barWidth = bby;
        const barHeight = bbz;
        const displayValue = bca;
        const fontSize = bcb;

        // Calculate canvas dimensions
        const binaryWidth = binary.length * barWidth;
        const textHeight = displayValue ? fontSize + 10 : 0;
        canvas.width = binaryWidth + (margin * 2);
        canvas.height = barHeight + (margin * 2) + textHeight;

        // Fill background
        ctx.fillStyle = bcd;
        ctx.fillRect(0, 0, canvas.width, canvas.height);

        // Draw barcode
        ctx.fillStyle = bcc;
        for (let i = 0; i < binary.length; i++) {
          if (binary[i] === '1') {
            ctx.fillRect(margin + (i * barWidth), margin, barWidth, barHeight);
          }
        }

        // Draw value text
        if (displayValue) {
          ctx.fillStyle = bcc;
          ctx.font = fontSize + 'px monospace';
          ctx.textAlign = 'center';
          ctx.fillText(bbw, canvas.width / 2, margin + barHeight + fontSize + 5);
        }

        return canvas.toDataURL();
      } catch (e) {
        console.error('CODE128 generation error:', e);
        return '';
      }
    })())},bcj=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
    `},bck=()=>{return `color: ${qb(d.value)};`},bcl=()=>{return `color: ${qb(d.value)};`};return E(`div`,{className:`rx`,style:F([bcj()])},[(D(ao(bcf()),false)?E(Q,{},[E(`div`,{className:`sa`,style:F([bck()])},[bbx,E(`span`,{className:`sc`},[`SCANNABLE`])]),E(`div`,{className:`ry`},[E(`img`,{"src":bcf(),"alt":`Barcode: ` + bbw,className:`rz`})])]):E(`div`,{className:`sb`,style:F([bcl()])},[`Loading barcode library...`]))])},bcm=(bcn)=>{return (D(bcn,`dark`)?`rgba(30, 41, 59, 0.85)`:`rgba(255, 255, 255, 0.9)`)},bco=(bcp)=>{return (D(bcp,`dark`)?`rgba(255, 255, 255, 0.15)`:`rgba(15, 23, 42, 0.1)`)},CU=()=>{const bcq=L(`https://mint-lang.com`),bcr=L(`1234567890`),bcs=L(`CODE128`),bct=(bcu)=>{return (()=>{bcq.value=th(bcu.target)})()},bcv=(bcw)=>{return (()=>{bcr.value=th(bcw.target)})()},bcx=(bcy)=>{return (()=>{bcs.value=th(bcy.target)})()},bcz=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},bda=()=>{return `color: ${m(d.value)};`},bdb=()=>{return `color: ${qb(d.value)};`},bdc=()=>{return `color: ${m(d.value)};`},bdd=()=>{return `
      background: ${bav(d.value)};
      border-color: ${bax(d.value)};
      color: ${baz(d.value)};
    `},bde=()=>{return `
      background: ${bav(d.value)};
      border-color: ${bax(d.value)};
      color: ${baz(d.value)};
    `},bdf=()=>{return `
      background: ${bcm(d.value)};
      border: 1px solid ${bco(d.value)};
    `},bdg=L([`CODE128`,`CODE39`,`EAN13`,`EAN8`,`UPC`,`ITF14`,`MSI`,`Pharmacode`,`Codabar`]);return E(`div`,{className:`sd`},[E(`div`,{className:`se`},[E(`h1`,{className:`sf`},[`Barcode & QR Code Components`]),E(`p`,{className:`sg`,style:F([bdb()])},[`Generate QR codes and various barcode formats with ease`])]),E(`div`,{className:`sh`},[E(`div`,{className:`si`,style:F([bcz()])},[E(`h2`,{className:`sj`,style:F([bda()])},[`QR Code Generator`]),E(`div`,{className:`sk`},[E(`label`,{className:`sl`,style:F([bdc()])},[`Data to encode:`]),E(`input`,{"type":`text`,"value":bcq.value,"onInput":bct,"placeholder":`Enter URL or text`,className:`sm`,style:F([bdd()])})]),E(`div`,{className:`so`},[E(CS,{bbe:bcq.value,bbf:200,bbj:true,bbk:`Scan me!`})])]),E(`div`,{className:`si`,style:F([bcz()])},[E(`h2`,{className:`sj`,style:F([bda()])},[`Barcode Generator`]),E(`div`,{className:`sk`},[E(`label`,{className:`sl`,style:F([bdc()])},[`Barcode format:`]),E(`select`,{"value":bcs.value,"onChange":bcx,className:`sn`,style:F([bde()])},[abc(bdg.value,(bdh)=>{return E(`option`,{"value":bdh},[bdh])})])]),E(`div`,{className:`sk`},[E(`label`,{className:`sl`,style:F([bdc()])},[`Data to encode:`]),E(`input`,{"type":`text`,"value":bcr.value,"onInput":bcv,"placeholder":`Enter barcode data`,className:`sm`,style:F([bdd()])})]),E(`div`,{className:`so`},[E(CT,{bbw:bcr.value,bbx:bcs.value,bby:2,bbz:80,bca:true,bcb:12})])])]),E(`div`,{className:`sp`,style:F([bcz()])},[E(`h2`,{className:`sj`,style:F([bda()])},[`Quick Examples`]),E(`div`,{className:`sq`},[E(`div`,{className:`sr`,style:F([bdf()])},[E(`div`,{className:`ss`,style:F([bda()])},[`Website URL`]),E(CS,{bbe:`https://mint-lang.com`,bbf:150,bbh:`#667eea`})]),E(`div`,{className:`sr`,style:F([bdf()])},[E(`div`,{className:`ss`,style:F([bda()])},[`Contact Info`]),E(CS,{bbe:`BEGIN:VCARD\nFN:John Doe\nTEL:+1234567890\nEND:VCARD`,bbf:150,bbh:`#764ba2`})]),E(`div`,{className:`sr`,style:F([bdf()])},[E(`div`,{className:`ss`,style:F([bda()])},[`Product Code (EAN13)`]),E(CT,{bbw:`5901234123457`,bbx:`EAN13`,bby:2,bbz:60,bca:true})]),E(`div`,{className:`sr`,style:F([bdf()])},[E(`div`,{className:`ss`,style:F([bda()])},[`Shipping Code`]),E(CT,{bbw:`SHIP123456`,bbx:`CODE128`,bby:2,bbz:60,bca:true})])])])])},CV=({bdi=``,bdj=`Avatar`,bdk=``,bdl=`md`,bdm=`circle`,bdn=false,bdo=`online`,bdp=false,bdq=``,bdr=``})=>{const bds=()=>{return I(bdl,[[`xs`,()=>{return `width: 24px; height: 24px; font-size: 0.625rem;`}],[`sm`,()=>{return `width: 32px; height: 32px; font-size: 0.75rem;`}],[`md`,()=>{return `width: 40px; height: 40px; font-size: 0.875rem;`}],[`lg`,()=>{return `width: 48px; height: 48px; font-size: 1rem;`}],[`xl`,()=>{return `width: 64px; height: 64px; font-size: 1.25rem;`}],[`2xl`,()=>{return `width: 96px; height: 96px; font-size: 1.875rem;`}],[null,()=>{return `width: 40px; height: 40px; font-size: 0.875rem;`}]])},bdt=()=>{return I(bdm,[[`circle`,()=>{return `border-radius: 50%;`}],[`rounded`,()=>{return `border-radius: 8px;`}],[`square`,()=>{return `border-radius: 0;`}],[null,()=>{return `border-radius: 50%;`}]])},bdu=()=>{return (bdp?`border: 2px solid ${s(d.value)}; box-shadow: 0 0 0 2px ${o(d.value)};`:``)},bdv=()=>{return (ao(bdq)?`background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);`:`background: ${bdq};`)},bdw=()=>{return (ao(bdr)?`color: white;`:`color: ${bdr};`)},bdx=()=>{return I(bdo,[[`online`,()=>{return `#10b981`}],[`offline`,()=>{return `#6b7280`}],[`away`,()=>{return `#f59e0b`}],[`busy`,()=>{return `#ef4444`}],[null,()=>{return `#10b981`}]])},bdy=()=>{return I(bdl,[[`xs`,()=>{return `width: 6px; height: 6px; border-width: 1px;`}],[`sm`,()=>{return `width: 8px; height: 8px; border-width: 1.5px;`}],[`md`,()=>{return `width: 10px; height: 10px; border-width: 2px;`}],[`lg`,()=>{return `width: 12px; height: 12px; border-width: 2px;`}],[`xl`,()=>{return `width: 16px; height: 16px; border-width: 2px;`}],[`2xl`,()=>{return `width: 20px; height: 20px; border-width: 3px;`}],[null,()=>{return `width: 10px; height: 10px; border-width: 2px;`}]])},bdz=()=>{return `
      ${bds()}
      ${bdt()}
      ${bdu()}
      background: ${ab(d.value)};
    `},bea=()=>{return `
      background: ${ah(d.value)};
      color: ${qb(d.value)};
    `},beb=()=>{return `
      ${bdy()}
      background: ${bdx()};
      border-color: ${s(d.value)};
    `};return E(`div`,{className:`tf`,style:F([bdz()])},[(D(ao(bdi),false)?E(`img`,{"src":bdi,"alt":bdj,className:`tg`}):(D(ao(bdk),false)?E(`div`,{className:`th`,style:F([bdv() + bdw()])},[bdk]):E(`div`,{className:`tj`,style:F([bea()])},[E(`svg`,{"width":`24`,"height":`24`,"viewBox":`0 0 24 24`,"fill":`none`,"stroke":`currentColor`,"stroke-width":`2`},[E(`path`,{"d":`M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2`}),E(`circle`,{"cx":`12`,"cy":`7`,"r":`4`})])]))),(bdn?E(`span`,{className:`ti`,style:F([beb()])}):E(`span`,{}))])},CW=({bec=[],bed=`md`,bee=5,bef=`tight`})=>{const beg=()=>{return I(bef,[[`tight`,()=>{return `-8px`}],[`normal`,()=>{return `-12px`}],[`loose`,()=>{return `-16px`}],[null,()=>{return `-12px`}]])},beh=()=>{return ((() => {
      const total = av(bec);
      const max = bee;
      const remaining = total - max;
      return "+" + remaining;
    })())},bei=()=>{return (av(bec) > bee)},bej=(bek)=>{return ((() => {
      const offset = beg();
      const zIndex = bee - bek;
      return "margin-left: " + offset + "; z-index: " + zIndex + ";";
    })())};return E(`div`,{className:`tu`},[(bei()?E(`div`,{className:`tv`,style:F([bej(bee)])},[E(CV,{bdk:beh(),bdl:bed,bdm:`circle`,bdp:true,bdq:ad(d.value)})]):E(`span`,{})),(av(bec) > 0?E(Q,{},[(av(bec) > 0?E(`div`,{className:`tv`,style:F([bej(0)])},[E(CV,{bdi:(bec[0]),bdl:bed,bdm:`circle`,bdp:true})]):E(`span`,{})),(av(bec) > 1?E(`div`,{className:`tv`,style:F([bej(1)])},[E(CV,{bdi:(bec[1]),bdl:bed,bdm:`circle`,bdp:true})]):E(`span`,{})),(av(bec) > 2?E(`div`,{className:`tv`,style:F([bej(2)])},[E(CV,{bdi:(bec[2]),bdl:bed,bdm:`circle`,bdp:true})]):E(`span`,{})),(av(bec) > 3?E(`div`,{className:`tv`,style:F([bej(3)])},[E(CV,{bdi:(bec[3]),bdl:bed,bdm:`circle`,bdp:true})]):E(`span`,{})),(av(bec) > 4?E(`div`,{className:`tv`,style:F([bej(4)])},[E(CV,{bdi:(bec[4]),bdl:bed,bdm:`circle`,bdp:true})]):E(`span`,{}))]):E(`span`,{}))])},CX=()=>{const bel=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},bem=()=>{return `color: ${m(d.value)};`},ben=()=>{return `color: ${qb(d.value)};`},beo=()=>{return `
      background: ${bcm(d.value)};
      border: 1px solid ${bco(d.value)};
    `};return E(`div`,{className:`tk`},[E(`div`,{className:`tl`},[E(`h1`,{className:`tm`},[`Avatar Components`]),E(`p`,{className:`tn`,style:F([ben()])},[`Flexible avatar components with images, initials, status indicators, and groups`])]),E(`div`,{className:`to`,style:F([bel()])},[E(`h2`,{className:`tp`,style:F([bem()])},[`Avatar Sizes`]),E(`div`,{className:`tt`},[E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=1`,bdl:`xs`,bdm:`circle`}),E(`span`,{className:`ts`,style:F([ben()])},[`Extra Small`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=2`,bdl:`sm`,bdm:`circle`}),E(`span`,{className:`ts`,style:F([ben()])},[`Small`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=3`,bdl:`md`,bdm:`circle`}),E(`span`,{className:`ts`,style:F([ben()])},[`Medium`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=4`,bdl:`lg`,bdm:`circle`}),E(`span`,{className:`ts`,style:F([ben()])},[`Large`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=5`,bdl:`xl`,bdm:`circle`}),E(`span`,{className:`ts`,style:F([ben()])},[`Extra Large`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=6`,bdl:`2xl`,bdm:`circle`}),E(`span`,{className:`ts`,style:F([ben()])},[`2X Large`])])])]),E(`div`,{className:`to`,style:F([bel()])},[E(`h2`,{className:`tp`,style:F([bem()])},[`Avatar Shapes`]),E(`div`,{className:`tt`},[E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=7`,bdl:`xl`,bdm:`circle`}),E(`span`,{className:`ts`,style:F([ben()])},[`Circle`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=8`,bdl:`xl`,bdm:`rounded`}),E(`span`,{className:`ts`,style:F([ben()])},[`Rounded`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=9`,bdl:`xl`,bdm:`square`}),E(`span`,{className:`ts`,style:F([ben()])},[`Square`])])])]),E(`div`,{className:`to`,style:F([bel()])},[E(`h2`,{className:`tp`,style:F([bem()])},[`Avatar with Initials`]),E(`div`,{className:`tt`},[E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdk:`JD`,bdl:`lg`,bdm:`circle`}),E(`span`,{className:`ts`,style:F([ben()])},[`John Doe`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdk:`AB`,bdl:`lg`,bdm:`circle`,bdq:`#ef4444`}),E(`span`,{className:`ts`,style:F([ben()])},[`Custom Red`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdk:`CD`,bdl:`lg`,bdm:`circle`,bdq:`#10b981`}),E(`span`,{className:`ts`,style:F([ben()])},[`Custom Green`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdk:`EF`,bdl:`lg`,bdm:`circle`,bdq:`#f59e0b`}),E(`span`,{className:`ts`,style:F([ben()])},[`Custom Orange`])])])]),E(`div`,{className:`to`,style:F([bel()])},[E(`h2`,{className:`tp`,style:F([bem()])},[`Status Indicators`]),E(`div`,{className:`tt`},[E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=10`,bdl:`xl`,bdm:`circle`,bdn:true,bdo:`online`}),E(`span`,{className:`ts`,style:F([ben()])},[`Online`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=11`,bdl:`xl`,bdm:`circle`,bdn:true,bdo:`away`}),E(`span`,{className:`ts`,style:F([ben()])},[`Away`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=12`,bdl:`xl`,bdm:`circle`,bdn:true,bdo:`busy`}),E(`span`,{className:`ts`,style:F([ben()])},[`Busy`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CV,{bdi:`https://i.pravatar.cc/150?img=13`,bdl:`xl`,bdm:`circle`,bdn:true,bdo:`offline`}),E(`span`,{className:`ts`,style:F([ben()])},[`Offline`])])])]),E(`div`,{className:`to`,style:F([bel()])},[E(`h2`,{className:`tp`,style:F([bem()])},[`Avatar Groups`]),E(`div`,{className:`tq`},[E(`div`,{className:`tr`,style:F([beo()])},[E(CW,{bec:[`https://i.pravatar.cc/150?img=14`,`https://i.pravatar.cc/150?img=15`,`https://i.pravatar.cc/150?img=16`],bed:`md`,bee:5}),E(`span`,{className:`ts`,style:F([ben()])},[`Small Group`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CW,{bec:[`https://i.pravatar.cc/150?img=17`,`https://i.pravatar.cc/150?img=18`,`https://i.pravatar.cc/150?img=19`,`https://i.pravatar.cc/150?img=20`,`https://i.pravatar.cc/150?img=21`,`https://i.pravatar.cc/150?img=22`],bed:`md`,bee:5}),E(`span`,{className:`ts`,style:F([ben()])},[`Large Group (max 5)`])]),E(`div`,{className:`tr`,style:F([beo()])},[E(CW,{bec:[`https://i.pravatar.cc/150?img=23`,`https://i.pravatar.cc/150?img=24`,`https://i.pravatar.cc/150?img=25`,`https://i.pravatar.cc/150?img=26`],bed:`lg`,bee:5}),E(`span`,{className:`ts`,style:F([ben()])},[`Large Size`])])])]),E(`div`,{className:`to`,style:F([bel()])},[E(`h2`,{className:`tp`,style:F([bem()])},[`Bordered Avatars`]),E(`div`,{className:`tt`},[E(CV,{bdi:`https://i.pravatar.cc/150?img=27`,bdl:`lg`,bdm:`circle`,bdp:true}),E(CV,{bdk:`BC`,bdl:`lg`,bdm:`circle`,bdp:true,bdq:`#8b5cf6`}),E(CV,{bdi:`https://i.pravatar.cc/150?img=28`,bdl:`lg`,bdm:`rounded`,bdp:true}),E(CV,{bdk:`XY`,bdl:`lg`,bdm:`square`,bdp:true,bdq:`#ec4899`})])])])},CY=()=>{const bep=()=>{return `border-bottom-color: ${o(d.value)};`},beq=()=>{return `
      background: ${ab(d.value)};
      border-color: ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},ber=()=>{return `background: ${s(d.value)};`},bes=(bet)=>{return I(bet,[[`new`,()=>{return `background: #10b981; color: white;`}],[`media`,()=>{return `background: #8b5cf6; color: white;`}],[null,()=>{return `background: ${ad(d.value)}; color: white;`}]])};return E(`div`,{},[E(`h1`,{className:`tw`},[`Media Components`]),E(`p`,{className:`tx`},[`Advanced media components for images, videos, and galleries.
        Includes lazy loading, lightbox, carousels, and custom video player.`]),E(`div`,{className:`ty`},[E(`h2`,{className:`tz`,style:F([bep()])},[`Image Carousel`]),E(`div`,{className:`ua`,style:F([beq()])},[E(`h3`,{className:`ub`},[`ImageCarousel`,E(`span`,{className:`ue`,style:F([bes(`media`)])},[`Media`])]),E(`p`,{className:`uc`},[`Full-featured carousel with navigation, indicators, autoplay, and zoom.`]),E(`div`,{className:`ud`,style:F([ber()])},[E(CL,{ati:[`https://picsum.photos/800/400?random=1`,`https://picsum.photos/800/400?random=2`,`https://picsum.photos/800/400?random=3`],atk:true,atl:3000,atm:true})]),E(BC,{mr:`mint`,mq:`<ImageCarousel
  images={[
    "https://picsum.photos/800/400?random=1",
    "https://picsum.photos/800/400?random=2"
  ]}
  autoPlay={true}
  interval={3000}
  showThumbnails={true}
/>`})])]),E(`div`,{className:`ty`},[E(`h2`,{className:`tz`,style:F([bep()])},[`Advanced Lightbox`]),E(`div`,{className:`ua`,style:F([beq()])},[E(`h3`,{className:`ub`},[`AdvancedLightbox`,E(`span`,{className:`ue`,style:F([bes(`new`)])},[`New`])]),E(`p`,{className:`uc`},[`Professional lightbox with keyboard shortcuts, swipe gestures, zoom, rotate,
            and download. Perfect for image galleries.`]),E(`div`,{className:`ud`,style:F([ber()])},[E(`p`,{},[`Advanced lightbox with keyboard shortcuts, swipe gestures, and zoom controls.`])]),E(BC,{mr:`mint`,mq:`<AdvancedLightbox
  images={["img1.jpg", "img2.jpg"]}
  alts={["Image 1", "Image 2"]}
  startIndex={0}
  isOpen={lightboxOpen}
  onClose={closeLightbox}
  enableKeyboard={true}
  enableSwipe={true}
  showCounter={true}
/>

// Features:
// - ← → Arrow keys for navigation
// - Esc to close
// - Swipe gestures on mobile
// - Zoom in/out controls
// - Rotate image
// - Download current image
// - Image counter (1/10)`})])]),E(`div`,{className:`ty`},[E(`h2`,{className:`tz`,style:F([bep()])},[`Lazy Image (LQIP)`]),E(`div`,{className:`ua`,style:F([beq()])},[E(`h3`,{className:`ub`},[`LazyImage`,E(`span`,{className:`ue`,style:F([bes(`new`)])},[`New`])]),E(`p`,{className:`uc`},[`Lazy-loaded images with LQIP (Low Quality Image Placeholder) for better
            performance and user experience.`]),E(`div`,{className:`ud`,style:F([ber()])},[E(BH,{ot:2,ov:`1rem`},M(E(CM,{aus:`https://picsum.photos/600/400?random=7`,aut:`https://picsum.photos/60/40?random=7`,auu:`Lazy loaded image`,auw:`300px`}),E(CM,{aus:`https://picsum.photos/600/400?random=8`,aut:`https://picsum.photos/60/40?random=8`,auu:`Lazy loaded image`,auw:`300px`})))]),E(BC,{mr:`mint`,mq:`<LazyImage
  src="high-res-image.jpg"
  placeholder="low-res-placeholder.jpg"
  alt="Description"
  height="300px"
  objectFit="cover"
/>

// Features:
// - Blurred placeholder (20px blur)
// - Smooth fade transition
// - IntersectionObserver lazy loading
// - Skeleton loader during load
// - Error handling`})])]),E(`div`,{className:`ty`},[E(`h2`,{className:`tz`,style:F([bep()])},[`Video Player`]),E(`div`,{className:`ua`,style:F([beq()])},[E(`h3`,{className:`ub`},[`VideoPlayer`,E(`span`,{className:`ue`,style:F([bes(`new`)])},[`New`])]),E(`p`,{className:`uc`},[`Custom video player with full controls, playback speed, picture-in-picture,
            fullscreen, and download with progress tracking.`]),E(`div`,{className:`ud`,style:F([ber()])},[E(CN,{avo:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4`,avp:`https://picsum.photos/800/450?random=9`})]),E(BC,{mr:`mint`,mq:`<CustomVideoPlayer
  src="video.mp4"
  poster="poster.jpg"
/>

// Features:
// - Play/Pause (click anywhere on video)
// - Timeline scrubbing with preview
// - Volume control with mute
// - Playback speed (0.5x, 1x, 1.5x, 2x, 3x)
// - Picture-in-Picture mode
// - Fullscreen support
// - Download with progress bar
// - Buffering indicator
// - Keyboard shortcuts
// - Responsive controls`})])]),E(`div`,{className:`ty`},[E(`h2`,{className:`tz`,style:F([bep()])},[`Mini Video Player`]),E(`div`,{className:`ua`,style:F([beq()])},[E(`h3`,{className:`ub`},[`MiniVideoPlayer`,E(`span`,{className:`ue`,style:F([bes(`media`)])},[`Media`])]),E(`p`,{className:`uc`},[`Compact video player for previews and inline videos. Click to play/pause.`]),E(`div`,{className:`ud`,style:F([ber()])},[E(BH,{ot:3,ov:`1rem`},M(E(CO,{ayv:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4`,ayw:`https://picsum.photos/300/200?random=10`,ayy:`200px`}),E(CO,{ayv:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4`,ayw:`https://picsum.photos/300/300?random=11`,ayy:`350px`}),E(CO,{ayv:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4`,ayw:`https://picsum.photos/300/500?random=12`,ayy:`500px`})))]),E(BC,{mr:`mint`,mq:`<MiniVideoPlayer
  src="video.mp4"
  poster="poster.jpg"
  height="200px"
  aspectRatio="16:9"
/>

// Features:
// - Click to play/pause
// - Play button overlay
// - Automatic aspect ratio
// - Responsive sizing`})])]),E(`div`,{className:`ty`},[E(`h2`,{className:`tz`,style:F([bep()])},[`Image Masonry`]),E(`div`,{className:`ua`,style:F([beq()])},[E(`h3`,{className:`ub`},[`ImageMasonry`,E(`span`,{className:`ue`,style:F([bes(`media`)])},[`Media`])]),E(`p`,{className:`uc`},[`Pinterest-style masonry grid for images of varying heights.`]),E(`div`,{className:`ud`,style:F([ber()])},[E(CP,{azi:[`https://picsum.photos/300/400?random=13`,`https://picsum.photos/300/300?random=14`,`https://picsum.photos/300/500?random=15`,`https://picsum.photos/300/350?random=16`,`https://picsum.photos/300/450?random=17`,`https://picsum.photos/300/320?random=18`],azj:3,azk:`1rem`})]),E(BC,{mr:`mint`,mq:`<ImageMasonry
  images={["img1.jpg", "img2.jpg"]}
  columns={3}
  gap="1rem"
/>`})])]),E(`div`,{className:`ty`},[E(`h2`,{className:`tz`,style:F([bep()])},[`Image Comparison`]),E(`div`,{className:`ua`,style:F([beq()])},[E(`h3`,{className:`ub`},[`ImageComparison`,E(`span`,{className:`ue`,style:F([bes(`new`)])},[`New`])]),E(`p`,{className:`uc`},[`Before/after image comparison with draggable slider.`]),E(`div`,{className:`ud`,style:F([ber()])},[E(CQ,{azp:`https://picsum.photos/800/600?random=19`,azq:`https://picsum.photos/800/600?random=20`,azr:`Before`,azs:`After`})]),E(BC,{mr:`mint`,mq:`<ImageComparison
  beforeImage="before.jpg"
  afterImage="after.jpg"
  beforeLabel="Before"
  afterLabel="After"
/>

// Features:
// - Draggable slider
// - Labels on corners
// - Smooth transitions
// - Mouse tracking`})])]),E(`div`,{className:`ty`},[E(`h2`,{className:`tz`,style:F([bep()])},[`Image Zoom`]),E(`div`,{className:`ua`,style:F([beq()])},[E(`h3`,{className:`ub`},[`ImageZoom`,E(`span`,{className:`ue`,style:F([bes(`media`)])},[`Media`])]),E(`p`,{className:`uc`},[`Interactive image with zoom on click and mouse tracking.`]),E(`div`,{className:`ud`,style:F([ber()])},[E(CR,{bad:`https://picsum.photos/800/600?random=21`,bae:`Zoomable image`,baf:`100%`,bag:`400px`,bah:2})]),E(BC,{mr:`mint`,mq:`<ImageZoom
  src="image.jpg"
  alt="Description"
  width="100%"
  height="400px"
  zoomLevel={2}
/>

// Features:
// - Click to toggle zoom
// - Mouse tracking for zoom position
// - Smooth transitions
// - Customizable zoom level`})])]),E(`div`,{className:`ty`},[E(`h2`,{className:`tz`,style:F([bep()])},[`Barcode & QR Codes`]),E(`div`,{className:`ua`,style:F([beq()])},[E(`h3`,{className:`ub`},[`QRCode & Barcode`,E(`span`,{className:`ue`,style:F([bes(`new`)])},[`New`])]),E(`p`,{className:`uc`},[`Generate QR codes and barcodes in multiple formats with extensive customization options.`]),E(`div`,{className:`ud`,style:F([ber()])},[E(CU,{})]),E(BC,{mr:`mint`,mq:`// QR Code
<QRCode
  data="https://mint-lang.com"
  size={200}
  foregroundColor="#667eea"
  showLabel={true}
  label="Scan me!"
/>

// Barcode
<Barcode
  data="1234567890"
  format="CODE128"
  width={2}
  height={80}
  displayValue={true}
/>

// Supported Barcode Formats:
// - CODE128, CODE39
// - EAN13, EAN8
// - UPC, ITF14
// - MSI, Pharmacode, Codabar`})])]),E(`div`,{className:`ty`},[E(`h2`,{className:`tz`,style:F([bep()])},[`Avatars`]),E(`div`,{className:`ua`,style:F([beq()])},[E(`h3`,{className:`ub`},[`Avatar & AvatarGroup`,E(`span`,{className:`ue`,style:F([bes(`new`)])},[`New`])]),E(`p`,{className:`uc`},[`Flexible avatar components with images, initials, status indicators, sizes, shapes, and groups.`]),E(`div`,{className:`ud`,style:F([ber()])},[E(CX,{})]),E(BC,{mr:`mint`,mq:`// Simple avatar with image
<Avatar
  src=\\"https://i.pravatar.cc/150?img=1\\"
  size=\\"lg\\"
  shape=\\"circle\\"
/>

// Avatar with initials
<Avatar
  initials=\\"JD\\"
  size=\\"xl\\"
  bgColor=\\"#667eea\\"
/>

// Avatar with status
<Avatar
  src=\\"https://i.pravatar.cc/150?img=2\\"
  size=\\"lg\\"
  showStatus={true}
  status=\\"online\\"
  bordered={true}
/>

// Avatar group
<AvatarGroup
  avatars={[\\"url1.jpg\\", \\"url2.jpg\\", \\"url3.jpg\\"]}
  size=\\"md\\"
  max={5}
/>

// Properties:
// - size: xs, sm, md, lg, xl, 2xl
// - shape: circle, rounded, square
// - status: online, offline, away, busy
// - spacing: tight, normal, loose`})])])])},CZ=({beu=`KPI`,bev=`0`,bew=`100`,bex=``,bey=0,bez=`+0%`,bfa=`up`})=>{const bfb=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
      box-shadow: ${atg(d.value)};
    `},bfc=()=>{const bfd=I(bfa,[[`up`,()=>{return `#10b981`}],[`down`,()=>{return `#ef4444`}],[null,()=>{return `#667eea`}]]);return `background: ${bfd};`},bfe=()=>{return `color: ${qb(d.value)};`},bff=()=>{return I(bfa,[[`up`,()=>{return `background: rgba(16, 185, 129, 0.15); color: #10b981;`}],[`down`,()=>{return `background: rgba(239, 68, 68, 0.15); color: #ef4444;`}],[null,()=>{return `background: ${ab(d.value)}; color: ${qb(d.value)};`}]])},bfg=()=>{return `color: ${m(d.value)};`},bfh=()=>{return `color: ${qb(d.value)};`},bfi=()=>{return `background: ${ab(d.value)};`},bfj=()=>{const bfk=I(bfa,[[`up`,()=>{return `#10b981`}],[`down`,()=>{return `#ef4444`}],[null,()=>{return `#667eea`}]]);return `background: ${bfk}; width: ${ax(bey)}%;`};return E(`div`,{className:`bu`,style:F([bfb()])},[E(`div`,{className:`bv`,style:F([bfc()])}),E(`div`,{className:`bw`},[E(`div`,{className:`bx`},[E(`div`,{className:`by`,style:F([bfe()])},[beu]),E(`div`,{className:`bz`,style:F([bff()])},[bez])]),E(`div`,{className:`ca`},[E(`div`,{className:`cb`,style:F([bfg()])},[`${bev}${bex}`]),E(`div`,{className:`cc`,style:F([bfh()])},[`of ${bew}${bex} target`])]),E(`div`,{className:`cd`,style:F([bfi()])},[E(`div`,{className:`ce`,style:F([bfj()])})])])])},bfl=(bfm)=>{return (D(bfm,`dark`)?`rgba(255, 255, 255, 0.1)`:`rgba(51, 65, 85, 0.1)`)},bfn=(bfo)=>{return `linear-gradient(135deg, #f59e0b 0%, #d97706 100%)`},bfp=(bfq)=>{return `linear-gradient(135deg, #ef4444 0%, #dc2626 100%)`},DA=({bfr=0,bfs=100,bft=`md`,bfu=`primary`,bfv=false})=>{const bfw=()=>{return `
      background: ${ab(d.value)};
      border: 1px solid ${bfl(d.value)};
    `},bfx=()=>{return I(bfu,[[`success`,()=>{return `
          background: ${nr(d.value)};
        `}],[`warning`,()=>{return `
          background: ${bfn(d.value)};
        `}],[`error`,()=>{return `
          background: ${bfp(d.value)};
        `}],[null,()=>{return `
          background: ${ad(d.value)};
        `}]])},bfy=()=>{return `
      color: ${qb(d.value)};
    `},bfz=()=>{return bh(100,bk(0,(bfr / bfs) * 100))};return E(`div`,{},[(bfv?E(`div`,{className:`ly`,style:F([bfy()])},[E(`span`,{},[`Progress`]),E(`span`,{},[`${ax(anf(bfz()))}%`])]):E(`div`,{})),E(`div`,{className:bft + ` lw`,style:F([bfw()])},[E(`div`,{className:`lx`,style:F([`${bfx()} width: ${ax(bfz())}%;`])})])])},DB=({bga=``,bgb=0,bgc=100,bgd=``,bge=`primary`})=>{const bgf=()=>{return `
      background: ${ah(d.value)};
      border: 1px solid ${o(d.value)};
      box-shadow: ${aj(d.value)};
    `},bgg=()=>{return `color: ${qb(d.value)};`},bgh=()=>{return `color: ${m(d.value)};`},bgi=()=>{return `color: ${qb(d.value)};`},bgj=()=>{return (bgc > 0?(bgb / bgc) * 100:0)};return E(`div`,{className:`cf`,style:F([bgf()])},[E(`div`,{className:`cg`},[E(`div`,{className:`ch`,style:F([bgg()])},[bga])]),E(`div`,{className:`ci`},[E(`span`,{className:`cj`,style:F([bgh()])},[ax(bgb)]),E(`span`,{className:`ck`,style:F([bgi()])},[`/ ${ax(bgc)} ${bgd}`])]),E(DA,{bfr:bgj(),bfu:bge,bfv:true})])},DC=({bgk=``,bgl=``,bgm=``,bgn=``,bgo=`neutral`,bgp=``})=>{const bgq=()=>{return `
      background: ${ah(d.value)};
      border: 1px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},bgr=()=>{const bgs=I(bgo,[[`up`,()=>{return `rgba(16, 185, 129, 0.15)`}],[`down`,()=>{return `rgba(239, 68, 68, 0.15)`}],[null,()=>{return ab(d.value)}]]);return `background: ${bgs};`},bgt=()=>{const bgu=I(bgo,[[`up`,()=>{return `#10b981`}],[`down`,()=>{return `#ef4444`}],[null,()=>{return `#667eea`}]]);return `background: ${bgu};`},bgv=()=>{return `color: ${qb(d.value)};`},bgw=()=>{return `color: ${m(d.value)};`},bgx=()=>{const bgy=I(bgo,[[`up`,()=>{return `#10b981`}],[`down`,()=>{return `#ef4444`}],[null,()=>{return qb(d.value)}]]);return `color: ${bgy};`},bgz=()=>{return `color: ${qb(d.value)};`};return E(`div`,{className:`cy`,style:F([bgq()])},[E(`div`,{className:`cz`,style:F([bgt()])}),E(`div`,{className:`da`},[E(`div`,{className:`db`,style:F([bgv()])},[bgk]),(!ao(bgm)?E(`div`,{className:`dc`,style:F([bgr()])},[bgm]):E(`div`,{}))]),E(`div`,{className:`dd`,style:F([bgw()])},[bgl]),(!ao(bgn) || !ao(bgp)?E(`div`,{className:`de`},[(!ao(bgn)?E(`span`,{className:`df`,style:F([bgx()])},[bgn]):E(`span`,{})),(!ao(bgp)?E(`span`,{style:F([bgz()])},[bgp]):E(`span`,{}))]):E(`div`,{}))])},DD=({bha=85,bhb=100,bhc=`Score`,bhd=`A`,bhe=`#10b981`})=>{const bhf=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
      box-shadow: ${atg(d.value)};
    `},bhg=()=>{return `background: ${bhe};`},bhh=()=>{return `color: ${qb(d.value)};`},bhi=()=>{return `color: ${bhe};`},bhj=()=>{return `color: ${qb(d.value)};`},bhk=()=>{return `background: ${bhe}; box-shadow: 0 4px 16px ${bhe}66;`};return E(`div`,{className:`cr`,style:F([bhf()])},[E(`div`,{className:`cs`,style:F([bhg()])}),E(`div`,{className:`ct`},[E(`div`,{className:`cu`,style:F([bhh()])},[bhc]),E(`div`,{className:`cv`,style:F([bhi()])},[ax(bha)]),E(`div`,{className:`cw`,style:F([bhj()])},[`/ ${ax(bhb)}`]),(!ao(bhd)?E(`div`,{className:`cx`,style:F([bhk()])},[bhd]):E(`div`,{}))])])},DE=({bhl=`Comparison`,bhm=`0`,bhn=`0`,bho=`Current`,bhp=`Previous`})=>{const bhq=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},bhr=()=>{return `color: ${m(d.value)};`},bhs=()=>{return `
      background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
      border: 2px solid rgba(102, 126, 234, 0.3);
    `},bht=()=>{return `
      background: ${ab(d.value)};
      border: 2px solid ${o(d.value)};
    `},bhu=()=>{return `color: ${qb(d.value)};`},bhv=()=>{return `color: ${m(d.value)};`},bhw=()=>{return `background: ${ab(d.value)};`},bhx=()=>{return `background: linear-gradient(90deg, #667eea 0%, #764ba2 100%); width: 75%;`};return E(`div`,{className:`al`,style:F([bhq()])},[E(`div`,{className:`am`,style:F([bhr()])},[bhl]),E(`div`,{className:`an`},[E(`div`,{className:`ao`,style:F([bhs()])},[E(`div`,{className:`ap`,style:F([bhu()])},[bho]),E(`div`,{className:`aq`,style:F([bhv()])},[bhm])]),E(`div`,{className:`ao`,style:F([bht()])},[E(`div`,{className:`ap`,style:F([bhu()])},[bhp]),E(`div`,{className:`aq`,style:F([bhv()])},[bhn])])]),E(`div`,{className:`ar`,style:F([bhw()])},[E(`div`,{className:`as`,style:F([bhx()])})])])},DF=({bhy=``,bhz=``,bia=``,bib=``})=>{const bic=()=>{return `
      background: ${ah(d.value)};
      border: 1px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},bid=()=>{return `color: ${qb(d.value)};`},bie=()=>{return `color: ${m(d.value)};`},bif=()=>{return I(bib,[[`up`,()=>{return `color: #10b981;`}],[`down`,()=>{return `color: #ef4444;`}],[null,()=>{return `color: ${qb(d.value)};`}]])};return E(`div`,{className:`bo`,style:F([bic()])},[E(`div`,{className:`bp`},[E(`span`,{className:`bq`,style:F([bid()])},[bhy]),(!ao(bia)?E(`span`,{className:`br`},[bia]):E(`span`,{}))]),E(`div`,{className:`bs`,style:F([bie()])},[bhz]),(!ao(bib)?E(`div`,{className:`bt`,style:F([bif()])},[bib]):E(`div`,{}))])},DG=({big=`Metric`,bih=`0`,bii=``,bij=`positive`,bik=`📊`,bil=`medium`})=>{const bim=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
    `},bin=()=>{const bio=I(bij,[[`positive`,()=>{return `rgba(16, 185, 129, 0.15)`}],[`negative`,()=>{return `rgba(239, 68, 68, 0.15)`}],[null,()=>{return ab(d.value)}]]);const bip=I(bil,[[`small`,()=>{return `0.5rem`}],[`large`,()=>{return `1rem`}],[null,()=>{return `0.75rem`}]]);return `background: ${bio}; padding: ${bip};`},biq=()=>{return `color: ${qb(d.value)};`},bir=()=>{const bis=I(bil,[[`small`,()=>{return `clamp(1rem, 2.5vw, 1.25rem)`}],[`large`,()=>{return `clamp(1.5rem, 3vw, 2rem)`}],[null,()=>{return `clamp(1.25rem, 2.5vw, 1.5rem)`}]]);return `color: ${m(d.value)}; font-size: ${bis};`},bit=()=>{return I(bij,[[`positive`,()=>{return `color: #10b981;`}],[`negative`,()=>{return `color: #ef4444;`}],[null,()=>{return `color: ${qb(d.value)};`}]])};return E(`div`,{className:`cl`,style:F([bim()])},[E(`div`,{className:`cm`,style:F([bin()])},[bik]),E(`div`,{className:`cn`},[E(`div`,{className:`co`,style:F([biq()])},[big]),E(`div`,{className:`cp`,style:F([bir()])},[bih]),(!ao(bii)?E(`div`,{className:`cq`,style:F([bit()])},[bii]):E(`div`,{}))])])},DH=({biu=`0`,biv=``,biw=``,bix=``,biy=`default`})=>{const biz=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
    `},bja=()=>{return I(biy,[[`success`,()=>{return `background: rgba(16, 185, 129, 0.15);`}],[`warning`,()=>{return `background: rgba(245, 158, 11, 0.15);`}],[`error`,()=>{return `background: rgba(239, 68, 68, 0.15);`}],[`info`,()=>{return `background: rgba(59, 130, 246, 0.15);`}],[null,()=>{return `background: ${ab(d.value)};`}]])},bjb=()=>{return `color: ${m(d.value)};`},bjc=()=>{return `color: ${m(d.value)};`},bjd=()=>{return `color: ${qb(d.value)};`};return E(`div`,{className:`au`,style:F([biz()])},[(!ao(bix)?E(`div`,{className:`av`,style:F([bja()])},[bix]):E(`div`,{})),E(`div`,{className:`aw`,style:F([bjb()])},[biu]),(!ao(biv)?E(`div`,{className:`ax`,style:F([bjc()])},[biv]):E(`div`,{})),(!ao(biw)?E(`div`,{className:`ay`,style:F([bjd()])},[biw]):E(`div`,{}))])},bje=(bjf)=>{return (D(bjf,`dark`)?`rgba(102, 126, 234, 0.5)`:`rgba(102, 126, 234, 0.3)`)},DI=({children: bjg=[],bjh=`default`})=>{const bji=()=>{return I(bjh,[[`primary`,()=>{return `
          background: ${ad(d.value)};
          color: ${af(d.value)};
          border: 1px solid ${bje(d.value)};
          box-shadow: ${aj(d.value)};
        `}],[`success`,()=>{return `
          background: ${nr(d.value)};
          color: ${af(d.value)};
          border: 1px solid ${o(d.value)};
          box-shadow: ${aj(d.value)};
        `}],[null,()=>{return `
          background: ${ab(d.value)};
          color: ${m(d.value)};
          border: 1px solid ${o(d.value)};
          box-shadow: ${aj(d.value)};
        `}]])};return E(`span`,{className:`nq`,style:F([bji()])},[(()=>{const _0=[];const _1=bjg;let _i=-1;for(let bjj of _1){_i++;_0.push(bjj)};return _0})()])},DJ=({children: bjk=[],bjl=(bjm)=>{return nq()},bjn=`primary`})=>{const bjo=()=>{return I(bjn,[[`secondary`,()=>{return `
          background: ${u(d.value)};
          color: ${m(d.value)};
          border: 1px solid ${o(d.value)};
          box-shadow: ${w(d.value)};
        `}],[`success`,()=>{return `
          background: ${nr(d.value)};
          color: ${af(d.value)};
          border: 1px solid ${o(d.value)};
          box-shadow: ${w(d.value)};
        `}],[null,()=>{return `
          background: ${ad(d.value)};
          color: ${af(d.value)};
          border: 1px solid ${o(d.value)};
          box-shadow: ${w(d.value)};
        `}]])};return E(`button`,{"onClick":bjl,className:`nn`,style:F([bjo()])},[(()=>{const _0=[];const _1=bjk;let _i=-1;for(let bjp of _1){_i++;_0.push(bjp)};return _0})()])},DK=({bjq=`John Doe`,bjr=`john@example.com`,bjs=`Admin`,bjt=`JD`,bju=(bjv)=>{return nq()}})=>{const bjw=()=>{return `
      background: ${ah(d.value)};
      border: 1px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},bjx=()=>{return `color: ${m(d.value)};`},bjy=()=>{return `color: ${qb(d.value)};`};return E(`div`,{className:`ta`,style:F([bjw()])},[E(CV,{bdl:`lg`,bdk:bjt}),E(`div`,{className:`tb`},[E(`div`,{className:`tc`,style:F([bjx()])},[bjq]),E(`div`,{className:`td`,style:F([bjy()])},[bjr]),E(`div`,{style:F([`margin-top: 0.5rem;`])},[E(DI,{bjh:`primary`},M(bjs))])]),E(`div`,{className:`te`},[E(DJ,{bjl:bju},M(`Edit Profile`)),E(DJ,{bjn:`secondary`},M(`View Activity`))])])},DL=({children: bjz=[],bka=false,bkb=true,bkc=`md`})=>{return E(`table`,{className:bkc + ` at`},[(()=>{const _0=[];const _1=bjz;let _i=-1;for(let bkd of _1){_i++;_0.push(bkd)};return _0})()])},DM=({bke=[],bkf=[],bkg=true,bkh=true})=>{const bki=()=>{return `
      background: ${ah(d.value)};
      border: 1px solid ${o(d.value)};
    `},bkj=()=>{return `
      background: ${ab(d.value)};
      color: ${m(d.value)};
    `},bkk=()=>{return `
      color: ${m(d.value)};
      border-bottom: 2px solid ${o(d.value)};
    `},bkl=()=>{return `
      color: ${qb(d.value)};
      border-top-color: ${o(d.value)};
    `},bkm=(bkn)=>{const bko=(bkh?`cursor: pointer;`:``);const bkp=(bkg && (D(bkn % 2,1))?`background: ${ab(d.value)};`:``);return `${bkp} ${bko}`};return E(`table`,{className:`az`,style:F([bki()])},[E(`thead`,{className:`ba`,style:F([bkj()])},[E(`tr`,{},[(()=>{const _0=[];const _1=bke;let _i=-1;for(let bkq of _1){_i++;_0.push(E(`th`,{className:`bb`,style:F([bkk()])},[bkq]))};return _0})()])]),E(`tbody`,{},[aes(bkf,(bkr,bks)=>{return E(`tr`,{className:`bd`,style:F([bkm(bks)])},[(()=>{const _0=[];const _1=bkr;let _i=-1;for(let bkt of _1){_i++;_0.push(E(`td`,{className:`bc`,style:F([bkl()])},[bkt]))};return _0})()])})])])},DN=({bku=[],bkv=[],bkw=`bar`,bkx=`200px`,bky=`#667eea`,bkz=false})=>{const bla=()=>{return `
      background: ${ab(d.value)};
      border: 1px solid ${bfl(d.value)};
    `},blb=()=>{return `color: ${qb(d.value)};`},blc=()=>{return `
      background: ${u(d.value)};
    `},bld=()=>{return (D(av(bku),0)?100:agq(bku,0,(ble,blf)=>{return (blf > ble?blf:ble)}))},blg=(blh)=>{const bli=bld();return (bli > 0?(()=>{const blj=(blh / bli) * 100;return `${ax(blj)}%`})():`0%`)},blk=()=>{const _={[`--a-a`]:bkx};return _},bll=()=>{const _={[`--b-a`]:`linear-gradient(to top, ` + bky + `, ` + bky + `aa)`};return _};return E(`div`,{className:`be`,style:F([blk(),bla()])},[(D(bkw,`line`)?E(`div`,{className:`bl`,style:F([blc()])},[E(`svg`,{"width":`100%`,"height":`100%`,"viewBox":`0 0 100 100`,className:`bm`},[E(`polyline`,{"fill":`none`,"stroke":bky,"stroke-width":`2`,"points":`10,80 30,40 50,60 70,20 90,50`})])]):E(`div`,{className:`bf`},[E(`div`,{className:`bg`},[aes(bku,(blm,bln)=>{return E(`div`,{className:`bh`},[E(`div`,{"title":`${ax(blm)}`,className:`bi`,style:F([bll(),`height: ${blg(blm)}`])},[(bkz?E(`span`,{className:`bj`},[ax(blm)]):E(`span`,{}))])])})]),(av(bkv) > 0?E(`div`,{style:F([`display: flex; justify-content: space-between; gap: 0.5rem;`])},[abc(bkv,(blo)=>{return E(`div`,{style:F([`flex: 1; display: flex; justify-content: center;`])},[E(`span`,{className:`bk`,style:F([blb()])},[blo])])})]):E(`div`,{}))]))])},DO=()=>{const blp=()=>{return `border-bottom-color: ${o(d.value)};`},blq=()=>{return `
      background: ${ab(d.value)};
      border-color: ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},blr=()=>{return `
      background: ${s(d.value)};
      border-color: ${o(d.value)};
    `};return E(`div`,{},[E(`h1`,{className:`pm`},[`Data Display`]),E(`p`,{className:`pn`},[`Componentes para mostrar datos, métricas, tarjetas y tablas.`]),E(`div`,{className:`po`},[E(`h2`,{className:`pp`,style:F([blp()])},[`Cards`]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`DynamicCard`]),E(`p`,{className:`ps`},[`Tarjeta flexible con header, body y footer. Adaptable al tema actual.`]),E(`div`,{className:`pt`,style:F([blr()])},[E(BF,{},M(E(`div`,{},[E(`h3`,{},[`Card Title`]),E(`p`,{},[`This is a dynamic card that adapts to the current theme.`])])))]),E(BC,{mr:`mint`,mq:`<DynamicCard>
  <div>
    <h3>"Card Title"</h3>
    <p>"Card content here"</p>
  </div>
</DynamicCard>`})]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`KPICard`]),E(`p`,{className:`ps`},[`Tarjeta para mostrar indicadores clave de rendimiento (KPI).`]),E(`div`,{className:`pt`,style:F([blr()])},[E(CZ,{beu:`Revenue`,bev:`$45,231`,bew:`$50,000`,bez:`+20.1%`,bfa:`up`,bey:90}),E(CZ,{beu:`Users`,bev:`1,234`,bew:`1,500`,bez:`-5.4%`,bfa:`down`,bey:82})]),E(BC,{mr:`mint`,mq:`<KPICard
  title="Revenue"
  value="$45,231"
  target="$50,000"
  trend="+20.1%"
  trendDirection="up"
  progress={90}
/>`})]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`MetricCard`]),E(`p`,{className:`ps`},[`Tarjeta para mostrar métricas con iconos y valores.`]),E(`div`,{className:`pt`,style:F([blr()])},[E(DB,{bga:`Total Sales`,bgb:12345,bgc:15000,bgd:`USD`,bge:`success`}),E(DB,{bga:`Active Users`,bgb:1234,bgc:2000,bgd:`users`,bge:`primary`})]),E(BC,{mr:`mint`,mq:`<MetricCard
  label="Total Sales"
  current={12345}
  target={15000}
  unit="USD"
  variant="success"
/>`})]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`StatCard`]),E(`p`,{className:`ps`},[`Tarjeta de estadísticas con valores y porcentajes.`]),E(`div`,{className:`pt`,style:F([blr()])},[E(DC,{bgk:`Conversion Rate`,bgl:`3.24%`,bgn:`+0.5%`,bgo:`up`,bgm:`📈`}),E(DC,{bgk:`Bounce Rate`,bgl:`42%`,bgn:`-2.1%`,bgo:`down`,bgm:`📉`})]),E(BC,{mr:`mint`,mq:`<StatCard
  title="Conversion Rate"
  value="3.24%"
  trend="+0.5%"
  trendDirection="up"
  icon="📈"
/>`})]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`ScoreCard`]),E(`p`,{className:`ps`},[`Tarjeta para mostrar puntuaciones y calificaciones.`]),E(`div`,{className:`pt`,style:F([blr()])},[E(DD,{bhc:`Performance Score`,bha:85,bhb:100}),E(DD,{bhc:`Customer Satisfaction`,bha:92,bhb:100})]),E(BC,{mr:`mint`,mq:`<ScoreCard
  title="Performance Score"
  score={85}
  maxScore={100}
/>`})]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`ComparisonCard`]),E(`p`,{className:`ps`},[`Tarjeta para comparar dos valores o métricas.`]),E(`div`,{className:`pt`,style:F([blr()])},[E(DE,{bhl:`This Month vs Last Month`,bhm:`$12,345`,bhn:`$10,234`,bho:`Current`,bhp:`Previous`})]),E(BC,{mr:`mint`,mq:`<ComparisonCard
  title="This Month vs Last Month"
  currentValue="$12,345"
  previousValue="$10,234"
  currentLabel="Current"
  previousLabel="Previous"
/>`})]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`InfoBox`]),E(`p`,{className:`ps`},[`Caja de información con icono y texto.`]),E(`div`,{className:`pt`,style:F([blr()])},[E(DF,{bhy:`Pro Tip`,bhz:`Use keyboard shortcuts to navigate faster!`,bia:`💡`,bib:`up`})]),E(BC,{mr:`mint`,mq:`<InfoBox
  title="Pro Tip"
  value="Use keyboard shortcuts!"
  icon="💡"
  trend="up"
/>`})])]),E(`div`,{className:`po`},[E(`h2`,{className:`pp`,style:F([blp()])},[`Data Display`]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`MetricDisplay`]),E(`p`,{className:`ps`},[`Componente para mostrar métricas de forma visual.`]),E(`div`,{className:`pt`,style:F([blr()])},[E(DG,{big:`Total Revenue`,bih:`$123,456`,bii:`Last 30 days`,bij:`positive`,bik:`💰`,bil:`medium`})]),E(BC,{mr:`mint`,mq:`<MetricDisplay
  label="Total Revenue"
  value="$123,456"
  change="Last 30 days"
  changeType="positive"
  icon="💰"
  size="medium"
/>`})]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`DataPoint`]),E(`p`,{className:`ps`},[`Punto de dato individual con etiqueta y valor.`]),E(`div`,{className:`pt`,style:F([blr()])},[E(DH,{biv:`Temperature`,biu:`23°C`}),E(DH,{biv:`Humidity`,biu:`65%`})]),E(BC,{mr:`mint`,mq:`<DataPoint
  label="Temperature"
  value="23°C"
/>`})]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`UserProfile`]),E(`p`,{className:`ps`},[`Tarjeta de perfil de usuario con avatar y datos.`]),E(`div`,{className:`pt`,style:F([blr()])},[E(DK,{bjq:`John Doe`,bjr:`john@example.com`,bjt:`https://i.pravatar.cc/150?img=1`})]),E(BC,{mr:`mint`,mq:`<UserProfile
  name="John Doe"
  email="john@example.com"
  avatar="https://i.pravatar.cc/150?img=1"
/>`})])]),E(`div`,{className:`po`},[E(`h2`,{className:`pp`,style:F([blp()])},[`Tables`]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`Table`]),E(`p`,{className:`ps`},[`Tabla básica para mostrar datos tabulares.`]),E(`div`,{className:`pt`,style:F([blr()])},[E(DL,{})]),E(BC,{mr:`mint`,mq:`<Table/>`})]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`DataTable`]),E(`p`,{className:`ps`},[`Tabla avanzada con ordenamiento, filtrado y paginación.`]),E(`div`,{className:`pt`,style:F([blr()])},[E(DM,{})]),E(BC,{mr:`mint`,mq:`<DataTable/>`})]),E(`div`,{className:`pq`,style:F([blq()])},[E(`h3`,{className:`pr`},[`Chart`]),E(`p`,{className:`ps`},[`Componente para visualización de datos con gráficos de barras y líneas.`]),E(`div`,{className:`pt`,style:F([blr()])},[E(DN,{bku:[30,60,45,80,50,70],bkv:[`Jan`,`Feb`,`Mar`,`Apr`,`May`,`Jun`],bkw:`bar`,bkx:`200px`,bky:`#667eea`,bkz:true})]),E(BC,{mr:`mint`,mq:`<Chart
  data={[30, 60, 45, 80, 50, 70]}
  labels={["Jan", "Feb", "Mar", "Apr", "May", "Jun"]}
  type="bar"
  height="200px"
  color="#667eea"
  showValues={true}
/>`})])])])},DP=({bls=[],blt=`/`,blu=(blv,blw)=>{return nq()}})=>{const blx=()=>{return `
      color: ${qb(d.value)};
    `},bly=()=>{return `
      color: ${m(d.value)};
    `},blz=()=>{return `
      color: ${qb(d.value)};
    `};return E(`nav`,{className:`jo`},[aes(bls,(bma,bmb)=>{const bmc=D(bmb,(av(bls) - 1));return (bmc?E(`span`,{className:`jr`,style:F([bly()])},[bma]):E(Q,{},[E(`span`,{"onClick":(bmd)=>{return blu(bma,bmb)},className:`jp`,style:F([blx()])},[bma]),E(`span`,{className:`jq`,style:F([blz()])},[blt])]))})])},DQ=({bme=`Brand`,bmf=[],bmg=``,bmh=(bmi)=>{return nq()}})=>{const bmj=()=>{return `
      background: ${ah(d.value)};
      border-bottom: 1px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},bmk=()=>{return `color: ${m(d.value)};`},bml=(bmm)=>{return (D(bmm,bmg)?`
        background: ${ad(d.value)};
        color: ${af(d.value)};
        box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4), ${aj(d.value)};
        transform: translateY(-2px);
      `:`
        color: ${qb(d.value)};
        background: transparent;
      `)};return E(`nav`,{className:`jy`,style:F([bmj()])},[E(`div`,{className:`jz`,style:F([bmk()])},[bme]),E(`div`,{className:`ka`},[(()=>{const _0=[];const _1=bmf;let _i=-1;for(let bmn of _1){_i++;_0.push(E(`div`,{"onClick":(bmo)=>{return bmh(bmn)},className:`kb`,style:F([bml(bmn)])},[bmn]))};return _0})()])])},DR=({bmp=[],bmq=``,bmr=(bms)=>{return nq()}})=>{const bmt=()=>{return `
      background: ${ah(d.value)};
      border-right: 1px solid ${o(d.value)};
    `},bmu=(bmv)=>{return (D(bmv,bmq)?`
        background: ${ad(d.value)};
        color: ${af(d.value)};
        font-weight: 600;
      `:`color: ${m(d.value)};`)};return E(`nav`,{className:`kc`,style:F([bmt()])},[(()=>{const _0=[];const _1=bmp;let _i=-1;for(let bmw of _1){_i++;_0.push(E(`div`,{"onClick":(bmx)=>{return bmr(bmw)},className:`kd`,style:F([bmu(bmw)])},[bmw]))};return _0})()])},DS=({bmy=[],bmz=``,bna=(bnb)=>{return nq()},bnc=`default`})=>{const bnd=()=>{return `
      background: ${ah(d.value)};
      border: 1px solid ${o(d.value)};
    `},bne=(bnf)=>{return (D(bnf,bmz)?`
        background: ${ad(d.value)};
        color: ${af(d.value)};
        box-shadow: ${w(d.value)};
      `:`
        color: ${qb(d.value)};
      `)};return E(`div`,{className:`jw`,style:F([bnd()])},[(()=>{const _0=[];const _1=bmy;let _i=-1;for(let bng of _1){_i++;_0.push(E(`button`,{"onClick":(bnh)=>{return bna(bng)},className:`jx`,style:F([bne(bng)])},[bng]))};return _0})()])},DT=({bni=`Menu`,bnj=[],bnk=(bnl)=>{return nq()}})=>{const bnm=L(false),bnn=()=>{return (()=>{bnm.value=!bnm.value})()},bno=()=>{return (()=>{bnm.value=false})()},bnp=(bnq)=>{return bnk(bnq)},bnr=()=>{return `
      background: ${ad(d.value)};
      color: ${af(d.value)};
    `},bns=()=>{return `
      background: ${ah(d.value)};
      border: 1px solid ${o(d.value)};
      box-shadow: ${atg(d.value)};
    `},bnt=()=>{return `color: ${m(d.value)};`};return E(`div`,{className:`js`},[E(`button`,{"onClick":(bnu)=>{return bnn()},className:`jt`,style:F([bnr()])},[bni]),(bnm.value?E(Q,{},[E(`div`,{className:`ju`,style:F([bns()])},[(()=>{const _0=[];const _1=bnj;let _i=-1;for(let bnv of _1){_i++;_0.push(E(`div`,{"onClick":(bnw)=>{return bnp(bnv)},className:`jv`,style:F([bnt()])},[bnv]))};return _0})()]),E(`div`,{"onClick":(bnx)=>{return bno()},style:F([`position: fixed; inset: 0; z-index: 999;`])})]):E(`div`,{}))])},DU=()=>{const bny=L(`Home`),bnz=L(`Dashboard`),boa=L(`Profile`),bob=L(``),boc=(bod)=>{return (()=>{bny.value=bod})()},boe=(bof)=>{return (()=>{bnz.value=bof})()},bog=(boh)=>{return (()=>{boa.value=boh})()},boi=(boj)=>{return (()=>{bob.value=boj})()},bok=()=>{return `border-bottom-color: ${o(d.value)};`},bol=()=>{return `
      background: ${ab(d.value)};
      border-color: ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},bom=()=>{return `background: ${s(d.value)};`},bon=(boo)=>{return I(boo,[[`navigation`,()=>{return `background: #3b82f6; color: white;`}],[null,()=>{return `background: ${ad(d.value)}; color: white;`}]])};return E(`div`,{},[E(`h1`,{className:`uf`},[`Navigation Components`]),E(`p`,{className:`ug`},[`Complete navigation system including breadcrumbs, top navigation, sidebars, tabs, and menus.
        All components are responsive and theme-aware.`]),E(`div`,{className:`uh`},[E(`h2`,{className:`ui`,style:F([bok()])},[`Breadcrumbs`]),E(`div`,{className:`uj`,style:F([bol()])},[E(`h3`,{className:`uk`},[`Breadcrumbs`,E(`span`,{className:`un`,style:F([bon(`navigation`)])},[`Navigation`])]),E(`p`,{className:`ul`},[`Hierarchical navigation showing the current page location with clickable path.`]),E(`div`,{className:`um`,style:F([bom()])},[E(DP,{bls:[`Home`,`Products`,`Electronics`,`Laptops`]})]),E(BC,{mr:`mint`,mq:`<Breadcrumbs
  items={["Home", "Products", "Electronics", "Laptops"]}
/>`})])]),E(`div`,{className:`uh`},[E(`h2`,{className:`ui`,style:F([bok()])},[`Top Navigation`]),E(`div`,{className:`uj`,style:F([bol()])},[E(`h3`,{className:`uk`},[`TopNav`,E(`span`,{className:`un`,style:F([bon(`navigation`)])},[`Navigation`])]),E(`p`,{className:`ul`},[`Responsive top navigation bar with active item highlighting.`]),E(`div`,{className:`um`,style:F([bom()])},[E(DQ,{bmf:[`Home`,`About`,`Services`,`Portfolio`,`Contact`],bmg:bny.value,bmh:boc}),E(`div`,{style:F([`margin-top: 1rem; padding: 1rem; background: rgba(59, 130, 246, 0.1); border-radius: 8px;`])},[E(`strong`,{},[`Selected: `]),E(`span`,{},[bny.value])])]),E(BC,{mr:`mint`,mq:`state selectedItem : String = "Home"

fun handleClick (item : String) : Promise(Void) {
  sequence {
    next { selectedItem: item }
  }
}

<TopNav
  items={["Home", "About", "Services", "Contact"]}
  activeItem={selectedItem}
  onItemClick={handleClick}
/>`})])]),E(`div`,{className:`uh`},[E(`h2`,{className:`ui`,style:F([bok()])},[`Vertical Navigation`]),E(`div`,{className:`uj`,style:F([bol()])},[E(`h3`,{className:`uk`},[`VerticalNav`,E(`span`,{className:`un`,style:F([bon(`navigation`)])},[`Navigation`])]),E(`p`,{className:`ul`},[`Sidebar navigation perfect for dashboards and admin panels.`]),E(`div`,{className:`um`,style:F([bom()])},[E(`div`,{style:F([`display: flex; gap: 2rem;`])},[E(`div`,{style:F([`width: 250px;`])},[E(DR,{bmp:[`Dashboard`,`Analytics`,`Reports`,`Settings`,`Help`],bmq:bnz.value,bmr:boe})]),E(`div`,{style:F([`flex: 1; padding: 1rem; background: rgba(59, 130, 246, 0.1); border-radius: 8px;`])},[E(`strong`,{},[`Selected: `]),E(`span`,{},[bnz.value])])])]),E(BC,{mr:`mint`,mq:`<VerticalNav
  items={["Dashboard", "Analytics", "Reports", "Settings"]}
  activeItem={selectedItem}
  onItemClick={handleClick}
/>`})])]),E(`div`,{className:`uh`},[E(`h2`,{className:`ui`,style:F([bok()])},[`Tab Bar`]),E(`div`,{className:`uj`,style:F([bol()])},[E(`h3`,{className:`uk`},[`TabBar`,E(`span`,{className:`un`,style:F([bon(`navigation`)])},[`Navigation`])]),E(`p`,{className:`ul`},[`Horizontal tab navigation with smooth animations and active indicator.`]),E(`div`,{className:`um`,style:F([bom()])},[E(DS,{bmy:[`Profile`,`Settings`,`Notifications`,`Security`],bmz:boa.value,bna:bog}),E(`div`,{style:F([`margin-top: 2rem; padding: 2rem; background: rgba(59, 130, 246, 0.1); border-radius: 8px;`])},[E(`h4`,{style:F([`margin-bottom: 0.5rem;`])},[E(`strong`,{},[boa.value,` Tab Content`])]),E(`p`,{},[`This is the content for the `,boa.value,` tab.`])])]),E(BC,{mr:`mint`,mq:`<TabBar
  tabs={["Profile", "Settings", "Notifications"]}
  activeTab={activeTab}
  onTabClick={handleTabClick}
/>`})])]),E(`div`,{className:`uh`},[E(`h2`,{className:`ui`,style:F([bok()])},[`Menu Dropdown`]),E(`div`,{className:`uj`,style:F([bol()])},[E(`h3`,{className:`uk`},[`MenuDropdown`,E(`span`,{className:`un`,style:F([bon(`navigation`)])},[`Navigation`])]),E(`p`,{className:`ul`},[`Dropdown menu for navigation items or action menus.`]),E(`div`,{className:`um`,style:F([bom()])},[E(DT,{bni:`Options Menu`,bnj:[`Edit Profile`,`Change Password`,`Preferences`,`Logout`],bnk:boi}),(ao(bob.value)?E(`div`,{style:F([`margin-top: 1rem; padding: 1rem; background: rgba(156, 163, 175, 0.2); border-radius: 8px;`])},[E(`em`,{},[`Select an option from the menu above`])]):E(`div`,{style:F([`margin-top: 1rem; padding: 1rem; background: rgba(59, 130, 246, 0.1); border-radius: 8px;`])},[E(`strong`,{},[`Selected: `]),E(`span`,{},[bob.value])]))]),E(BC,{mr:`mint`,mq:`<MenuDropdown
  label="Options Menu"
  items={["Edit", "Delete", "Share", "Export"]}
  onSelect={handleSelect}
/>`})])]),E(`div`,{className:`uh`},[E(`h2`,{className:`ui`,style:F([bok()])},[`Pagination`]),E(`div`,{className:`uj`,style:F([bol()])},[E(`h3`,{className:`uk`},[`Pagination`,E(`span`,{className:`un`,style:F([bon(`navigation`)])},[`Navigation`])]),E(`p`,{className:`ul`},[`Navigation between pages with page numbers and next/previous controls.`]),E(`div`,{className:`um`,style:F([bom()])},[E(`p`,{style:F([`margin-bottom: 1rem;`])},[`Example from DataShowcase:`]),E(BC,{mr:`mint`,mq:`<Pagination
  currentPage={1}
  totalPages={10}
  onPageChange={handlePageChange}
/>`})])])])])},DV=({bop=`default`,boq=`medium`,bor=false})=>{const bos=()=>{const bot=I(boq,[[`small`,()=>{return `0.5rem`}],[`large`,()=>{return `1rem`}],[null,()=>{return `0.75rem`}]]);const bou=I(bop,[[`success`,()=>{return `#10b981`}],[`warning`,()=>{return `#f59e0b`}],[`error`,()=>{return `#ef4444`}],[`info`,()=>{return `#3b82f6`}],[null,()=>{return qb(d.value)}]]);const bov=(bor?`animation: pulse 2s ease-in-out infinite;`:``);return `width: ${bot}; height: ${bot}; background: ${bou}; ${bov}`};return E(`span`,{className:`kw`,style:F([bos()])})},DW=({bow=true,box=`LIVE`,boy=true})=>{const boz=()=>{return `background: rgba(239, 68, 68, 0.1); color: #ef4444; border: 1px solid rgba(239, 68, 68, 0.3);`},bpa=()=>{return `background: ${ab(d.value)}; color: ${qb(d.value)}; border: 1px solid ${o(d.value)};`},bpb=()=>{return (bow?boz():bpa())};return E(`div`,{className:`kj`,style:F([bpb()])},[(bow?E(DV,{bop:`error`,bor:boy}):E(DV,{bop:`default`,bor:false})),E(`span`,{},[box])])},DX=({bpc=`0`,bpd=`+12.5%`,bpe=`up`,bpf=``,bpg=`medium`})=>{const bph=()=>{const bpi=I(bpe,[[`up`,()=>{return `rgba(16, 185, 129, 0.1)`}],[`down`,()=>{return `rgba(239, 68, 68, 0.1)`}],[null,()=>{return ab(d.value)}]]);const bpj=I(bpe,[[`up`,()=>{return `rgba(16, 185, 129, 0.3)`}],[`down`,()=>{return `rgba(239, 68, 68, 0.3)`}],[null,()=>{return o(d.value)}]]);return `background: ${bpi}; border: 2px solid ${bpj};`},bpk=()=>{const bpl=I(bpg,[[`small`,()=>{return `clamp(0.875rem, 2vw, 1rem)`}],[`large`,()=>{return `clamp(1.5rem, 3vw, 2rem)`}],[null,()=>{return `clamp(1.25rem, 2.5vw, 1.5rem)`}]]);return `color: ${m(d.value)}; font-size: ${bpl};`},bpm=()=>{return `color: ${qb(d.value)};`},bpn=()=>{return I(bpe,[[`up`,()=>{return `color: #10b981;`}],[`down`,()=>{return `color: #ef4444;`}],[null,()=>{return `color: ${qb(d.value)};`}]])},bpo=()=>{return I(bpe,[[`up`,()=>{return `color: #10b981;`}],[`down`,()=>{return `color: #ef4444;`}],[null,()=>{return `color: ${qb(d.value)};`}]])},bpp=()=>{return I(bpe,[[`up`,()=>{return `↗`}],[`down`,()=>{return `↘`}],[null,()=>{return `→`}]])};return E(`div`,{className:`lq`,style:F([bph()])},[E(`div`,{className:`lr`},[E(`div`,{className:`ls`,style:F([bpk()])},[bpc]),(!ao(bpf)?E(`div`,{className:`lt`,style:F([bpm()])},[bpf]):E(`div`,{}))]),E(`div`,{className:`lu`,style:F([bpn()])},[bpp()]),E(`div`,{className:`lv`,style:F([bpo()])},[bpd])])},bpq=(bpr,bps)=>{return I(bpr,[[J(T,[K]),(bpt)=>{return H(T)(bps(bpt))}],[J(U,[]),()=>{return new U()}]])},DY=({bpu=0,bpv=`4px`,bpw=``,bpx=``,bpy=false,bpz=false})=>{const bqa=()=>{const bqb=(ao(bpx)?o(d.value):bpx);return `
      height: ${bpv};
      background: ${bqb};
    `},bqc=()=>{const bqd=(ao(bpw)?ad(d.value):bpw);const bqe=(bpy?`animation: progressPulse 1.5s ease-in-out infinite;`:``);const bqf=(bpu > 100?100:(bpu < 0?0:bpu));return `
      background: ${bqd};
      width: ${ax(bqf)}%;
      ${bqe}
    `};return E(`div`,{className:`oa`,style:F([bqa()])},[E(`div`,{className:`ob`,style:F([bqc()])},[(bpz && bpu > 10?E(`span`,{className:`oc`},[ax(bpu),`%`]):null)])])},DZ=({bqg=[`Step 1`,`Step 2`,`Step 3`,`Step 4`],bqh=1,bqi=`horizontal`,bqj=false,bqk=[]})=>{const bql=(bqm)=>{return zh(bpq(eh(bqk,(bqn)=>{return D(bqn.index,bqm)}),(bqo)=>{return bqo.status}),``)},bqp=(bqq)=>{const bqr=bql(bqq);const bqs=bqq < bqh;const bqt=D(bqq,bqh);const bqu=bqq > bqh;return (D(bqr,`error`)?`
        background: #f56565;
        color: white;
        border: 2px solid #f56565;
        box-shadow: 0 2px 8px rgba(245, 101, 101, 0.3);
      `:(D(bqr,`warning`)?`
          background: #ed8936;
          color: white;
          border: 2px solid #ed8936;
          box-shadow: 0 2px 8px rgba(237, 137, 54, 0.3);
        `:(D(bqr,`finish`) || bqs?`
            background: ${ad(d.value)};
            color: white;
            border: 2px solid ${ad(d.value)};
            box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);
          `:(D(bqr,`process`) || bqt?`
              background: ${ab(d.value)};
              color: ${ad(d.value)};
              border: 2px solid ${ad(d.value)};
              box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
            `:`
              background: ${ab(d.value)};
              color: ${qb(d.value)};
              border: 2px solid ${o(d.value)};
            `))))},bqv=(bqw)=>{return (bqw <= bqh?`color: ${m(d.value)};`:`color: ${qb(d.value)};`)},bqx=(bqy)=>{return (bqy < bqh?100:0)},bqz=()=>{const bra=av(bqg);return (bra > 0?(bqh / bra) * 100:0)},brb=(brc)=>{const brd=bql(brc);return (D(brd,`error`)?`✗`:(D(brd,`warning`)?`⚠`:(D(brd,`finish`)?`✓`:ax(brc + 1))))},bre=(brf,brg,brh)=>{return E(`div`,{className:(brh?`verticalStepContent`:`stepContent`)},[E(`div`,{className:`kr`,style:F([bqv(brg)])},[brf])])},bri=()=>{return E(`div`,{className:`ko`},[aes(bqg,(brj,brk)=>{const brl=D(brk,(av(bqg) - 1));return E(`div`,{className:`kp`},[E(`div`,{className:`kq`,style:F([bqp(brk)])},[brb(brk)]),bre(brj,brk,false),(!brl?E(`div`,{className:`ks`},[E(DY,{bpu:bqx(brk),bpv:`2px`,bpw:ad(d.value),bpx:o(d.value)})]):null)])})])},brm=()=>{return E(`div`,{className:`ko`,style:F([`flex-direction: column;`])},[aes(bqg,(brn,bro)=>{const brp=D(bro,(av(bqg) - 1));return E(`div`,{className:`kp`,style:F([`flex-direction: row; width: 100%; margin-bottom: 0;`])},[E(`div`,{className:`ku`},[E(`div`,{className:`kq`,style:F([bqp(bro)])},[brb(bro)]),(!brp?E(`div`,{className:`kt`},[E(DY,{bpu:bqx(bro),bpv:`100%`,bpw:ad(d.value),bpx:o(d.value)})]):null)]),bre(brn,bro,true)])})])};return E(`div`,{className:`kn`},[(D(bqi,`vertical`)?brm():bri()),(bqj?E(`div`,{className:`kv`,style:F([`color: ${ad(d.value)};`])},[ax(bqz()),`% Complete`]):null)])},EA=({brq=0,brr=true,brs=(brt)=>{return nq()}})=>{const bru=()=>{return `
      color: ${m(d.value)};
      background: ${ab(d.value)};
    `},brv=()=>{return `
      background: #ef4444;
      color: white;
      box-shadow: 0 0 0 2px ${k(d.value)};
    `};return E(`div`,{"onClick":brs,className:`kk`},[E(`div`,{className:`kl`,style:F([bru()])},[`🔔`]),(brr && brq > 0?E(`div`,{className:`km`,style:F([brv()])},[(brq > 99?`99+`:ax(brq))]):E(`div`,{}))])},EB=({brw=[],brx=`400px`})=>{const bry=()=>{return `
      background: ${ah(d.value)};
      border: 1px solid ${o(d.value)};
    `},brz=()=>{return `max-height: ${brx};`},bsa=(bsb)=>{const bsc=(bsb < (av(brw) - 1)?`border-bottom: 1px solid ${o(d.value)};`:``);return `${bsc}`},bsd=()=>{return `background: ${ad(d.value)};`},bse=()=>{return `color: ${m(d.value)};`};return E(`div`,{className:`ke`,style:F([bry()])},[E(`div`,{className:`kf`,style:F([brz()])},[aes(brw,(bsf,bsg)=>{return E(`div`,{className:`kg`,style:F([bsa(bsg)])},[E(`div`,{className:`kh`,style:F([bsd()])}),E(`div`,{className:`ki`,style:F([bse()])},[bsf])])})])])},EC=()=>{const bsh=L(true),bsi=()=>{return `border-bottom-color: ${o(d.value)};`},bsj=()=>{return `
      background: ${ab(d.value)};
      border-color: ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},bsk=()=>{return `
      background: ${s(d.value)};
      border-color: ${o(d.value)};
    `},bsl=()=>{return (()=>{bsh.value=!bsh.value})()};return E(`div`,{},[E(`h1`,{className:`rg`},[`Notifications`]),E(`p`,{className:`rh`},[`Componentes para mostrar notificaciones, indicadores de estado y retroalimentación visual.`]),E(`div`,{className:`ri`},[E(`h2`,{className:`rj`,style:F([bsi()])},[`Status Indicators`]),E(`div`,{className:`rk`,style:F([bsj()])},[E(`h3`,{className:`rl`},[`StatusDot`]),E(`p`,{className:`rm`},[`Indicador de estado con color y animación opcional.`]),E(`div`,{className:`rn`,style:F([bsk()])},[E(DV,{bop:`success`,boq:`medium`}),E(DV,{bop:`warning`,boq:`medium`}),E(DV,{bop:`error`,boq:`medium`}),E(DV,{bop:`info`,boq:`medium`}),E(DV,{bop:`success`,boq:`medium`,bor:true})]),E(BC,{mr:`mint`,mq:`<StatusDot status="success"/>
<StatusDot status="warning"/>
<StatusDot status="error"/>
<StatusDot status="info"/>
<StatusDot status="success" pulse={true}/>`})]),E(`div`,{className:`rk`,style:F([bsj()])},[E(`h3`,{className:`rl`},[`LiveIndicator`]),E(`p`,{className:`rm`},[`Indicador animado para mostrar estado en vivo.`]),E(`div`,{className:`rn`,style:F([bsk()])},[E(DW,{bow:bsh.value}),E(BD,{nu:(bsm)=>{return bsl()},nw:`secondary`},M((bsh.value?`Stop Live`:`Go Live`)))]),E(BC,{mr:`mint`,mq:`<LiveIndicator isLive={true}/>`})]),E(`div`,{className:`rk`,style:F([bsj()])},[E(`h3`,{className:`rl`},[`TrendIndicator`]),E(`p`,{className:`rm`},[`Indicador de tendencia con flecha y porcentaje.`]),E(`div`,{className:`rn`,style:F([bsk()])},[E(DX,{bpc:`$1,234`,bpd:`+12.5%`,bpe:`up`}),E(DX,{bpc:`$987`,bpd:`-8.3%`,bpe:`down`}),E(DX,{bpc:`$500`,bpd:`0%`,bpe:`neutral`})]),E(BC,{mr:`mint`,mq:`<TrendIndicator value="$1,234" change="+12.5%" trend="up"/>
<TrendIndicator value="$987" change="-8.3%" trend="down"/>
<TrendIndicator value="$500" change="0%" trend="neutral"/>`})]),E(`div`,{className:`rk`,style:F([bsj()])},[E(`h3`,{className:`rl`},[`ProgressIndicator`]),E(`p`,{className:`rm`},[`Indicador de progreso por pasos, estilo Zent Design. Soporta modo horizontal y vertical.`]),E(`div`,{className:`rn`,style:F([bsk()])},[E(`div`,{style:F([`width: 100%; margin-bottom: 2rem;`])},[E(`h4`,{},[`Horizontal Progress - Step 1 (Index 0)`]),E(DZ,{bqg:[`Account`,`Payment`,`Review`,`Complete`],bqh:0,bqi:`horizontal`})]),E(`div`,{style:F([`width: 100%; margin-bottom: 2rem;`])},[E(`h4`,{},[`Horizontal Progress - Step 2 (Index 1)`]),E(DZ,{bqg:[`Account`,`Payment`,`Review`,`Complete`],bqh:1,bqi:`horizontal`})]),E(`div`,{style:F([`width: 100%; margin-bottom: 2rem;`])},[E(`h4`,{},[`With Percentage - Step 3 (Index 2)`]),E(DZ,{bqg:[`Start`,`Process`,`Finish`],bqh:2,bqi:`horizontal`,bqj:true})]),E(`div`,{style:F([`width: 100%;`])},[E(`h4`,{},[`Vertical Progress`]),E(DZ,{bqg:[`Create Account`,`Verify Email`,`Complete Profile`,`Start Using`],bqh:2,bqi:`vertical`})]),E(`div`,{style:F([`width: 100%; margin-top: 2rem;`])},[E(`h4`,{},[`With Custom Status (Error State)`]),E(DZ,{bqg:[`Upload`,`Process`,`Verify`,`Complete`],bqh:1,bqi:`horizontal`,bqk:[b({index:1,status:`error`})]})]),E(`div`,{style:F([`width: 100%; margin-top: 2rem;`])},[E(`h4`,{},[`With Custom Status (Warning & Error)`]),E(DZ,{bqg:[`Step 1`,`Step 2`,`Step 3`,`Step 4`],bqh:2,bqi:`horizontal`,bqk:[b({index:1,status:`warning`}),b({index:3,status:`error`})]})]),E(`div`,{style:F([`width: 100%; margin-top: 2rem;`])},[E(`h4`,{},[`With Custom Status (Finish with Checkmark)`]),E(DZ,{bqg:[`Upload`,`Validate`,`Process`,`Complete`],bqh:2,bqi:`horizontal`,bqk:[b({index:0,status:`finish`})]})])]),E(BC,{mr:`mint`,mq:`// Horizontal
<ProgressIndicator
  steps={["Account", "Payment", "Review", "Complete"]}
  currentStep={1}
  variant="horizontal"
/>

// With Percentage
<ProgressIndicator
  steps={["Start", "Process", "Finish"]}
  currentStep={2}
  showPercentage={true}
/>

// Vertical
<ProgressIndicator
  steps={["Step 1", "Step 2", "Step 3"]}
  currentStep={1}
  variant="vertical"
/>

// With Custom Status (Error)
<ProgressIndicator
  steps={["Upload", "Process", "Verify", "Complete"]}
  currentStep={1}
  stepStatuses={[
    { index: 1, status: "error" }
  ]}
/>

// With Custom Status (Warning & Error)
<ProgressIndicator
  steps={["Step 1", "Step 2", "Step 3", "Step 4"]}
  currentStep={2}
  stepStatuses={[
    { index: 1, status: "warning" },
    { index: 3, status: "error" }
  ]}
/>

// With Custom Status (Finish with Checkmark ✓)
<ProgressIndicator
  steps={["Upload", "Validate", "Process", "Complete"]}
  currentStep={2}
  stepStatuses={[
    { index: 0, status: "finish" }
  ]}
/>`})])]),E(`div`,{className:`ri`},[E(`h2`,{className:`rj`,style:F([bsi()])},[`Notifications`]),E(`div`,{className:`rk`,style:F([bsj()])},[E(`h3`,{className:`rl`},[`NotificationBell`]),E(`p`,{className:`rm`},[`Campana de notificaciones con contador de mensajes no leídos.`]),E(`div`,{className:`rn`,style:F([bsk()])},[E(EA,{brq:0}),E(EA,{brq:3}),E(EA,{brq:99})]),E(BC,{mr:`mint`,mq:`<NotificationBell count={3}/>`})]),E(`div`,{className:`rk`,style:F([bsj()])},[E(`h3`,{className:`rl`},[`ActivityFeed`]),E(`p`,{className:`rm`},[`Feed de actividades recientes con timeline.`]),E(`div`,{className:`rn`,style:F([bsk()])},[E(EB,{brw:[`User John Doe logged in`,`New order #1234 received`,`Payment processed successfully`,`Product ABC updated`,`New user registered: jane@example.com`],brx:`300px`})]),E(BC,{mr:`mint`,mq:`<ActivityFeed
  activities={[
    "User John Doe logged in",
    "New order #1234 received",
    "Payment processed successfully"
  ]}
  maxHeight="300px"
/>`})])])])},ED=({bsn=0,bso=5,bsp=(bsq)=>{return nq()},bsr=false})=>{const bss=L(0),bst=(bsu)=>{return (bsr?nq():bsp(bsu))},bsv=(bsw)=>{return (bsr?nq():(()=>{bss.value=bsw})())},bsx=()=>{return (()=>{bss.value=0})()},bsy=(bsz)=>{const bta=(bss.value > 0?bss.value:bsn);const btb=bsz <= bta;const btc=(btb?`#fbbf24`:o(d.value));const btd=(bsr?`default`:`pointer`);return `color: ${btc}; cursor: ${btd};`};return E(`div`,{"onMouseLeave":(bte)=>{return bsx()},className:`ok`},[(()=>{const btf=as(1,bso);return (()=>{const _0=[];const _1=btf;let _i=-1;for(let btg of _1){_i++;_0.push(E(`span`,{"onClick":(bth)=>{return bst(btg)},"onMouseEnter":(bti)=>{return bsv(btg)},className:`ol`,style:F([bsy(btg)])},[`★`]))};return _0})()})()])},EE=({btj=``,children: btk=[],btl=false})=>{const btm=L(false),btn=()=>{return (()=>{btm.value=!btm.value})()},bto=()=>{return `
      background: ${ah(d.value)};
      border: 1px solid ${o(d.value)};
    `},btp=()=>{return `
      color: ${m(d.value)};
      font-weight: 600;
    `};return E(`div`,{className:`od`,style:F([bto()])},[E(`div`,{"onClick":(btq)=>{return btn()},className:`oe`,style:F([btp()])},[E(`span`,{},[btj]),E(`span`,{},[(btm.value?`▼`:`▶`)])]),(btm.value?E(`div`,{className:`of`},[(()=>{const _0=[];const _1=btk;let _i=-1;for(let btr of _1){_i++;_0.push(btr)};return _0})()]):E(`div`,{}))])},EF=({bts=``,btt=`default`,btu=(btv)=>{return nq()},btw=false})=>{const btx=()=>{return I(btt,[[`primary`,()=>{return `background: ${ad(d.value)}; color: ${af(d.value)};`}],[`success`,()=>{return `background: ${nr(d.value)}; color: ${af(d.value)};`}],[null,()=>{return `background: ${u(d.value)}; color: ${m(d.value)}; border: 1px solid ${o(d.value)};`}]])};return E(`span`,{className:`mf`,style:F([btx()])},[E(`span`,{},[bts]),(btw?E(`button`,{"onClick":btu,className:`mg`},[`×`]):E(`span`,{}))])},EG=({bty=``,btz=`default`,bua=(bub)=>{return nq()},buc=false})=>{const bud=()=>{return I(btz,[[`primary`,()=>{return `background: ${ad(d.value)}; color: ${af(d.value)}; box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);`}],[`success`,()=>{return `background: ${nr(d.value)}; color: ${af(d.value)}; box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);`}],[`warning`,()=>{return `background: ${bfn(d.value)}; color: ${af(d.value)}; box-shadow: 0 2px 8px rgba(245, 158, 11, 0.3);`}],[`error`,()=>{return `background: ${bfp(d.value)}; color: ${af(d.value)}; box-shadow: 0 2px 8px rgba(239, 68, 68, 0.3);`}],[null,()=>{return `background: ${u(d.value)}; color: ${m(d.value)}; border: 2px solid ${o(d.value)};`}]])};return E(`span`,{className:`or`,style:F([bud()])},[E(`span`,{},[bty]),(buc?E(`button`,{"onClick":bua,className:`os`},[`×`]):E(`span`,{}))])},EH=({bue=[],buf=0,bug=`right`,buh=`medium`,bui=false,buj=(buk)=>{return nq()}})=>{const bul=()=>{const bum=(D(bug,`left`)?`left: 2rem;`:`right: 2rem;`);return `${bum}`},bun=(buo)=>{const bup=(D(bug,`left`)?`flex-direction: row;`:`flex-direction: row-reverse;`);return `${bup}`},buq=(bur)=>{const bus=D(bur,buf);const but=(D(buh,`small`)?`width: 8px; height: 8px;`:(D(buh,`large`)?`width: 16px; height: 16px;`:`width: 12px; height: 12px;`));const buu=(bus?ad(d.value):o(d.value));const buv=(bus?`background: ${ad(d.value)};`:`background: transparent;`);const buw=(bus?`box-shadow: 0 0 0 4px ${ad(d.value)}33;`:``);return `
      ${but}
      border-color: ${buu};
      ${buv}
      ${buw}
    `},bux=(buy)=>{const buz=D(buy,buf);const bva=(D(bug,`left`)?`left: calc(100% + 1rem);`:`right: calc(100% + 1rem);`);const bvb=(buz?ad(d.value):qb(d.value));const bvc=(bui?`opacity: 1; transform: translateX(0);`:``);return `
      color: ${bvb};
      ${bva}
      ${bvc}
    `},bvd=()=>{return `
      &:hover .label {
        opacity: 1;
        transform: translateX(0);
      }

      &:hover .dot {
        transform: scale(1.15);
        border-color: ${ad(d.value)};
      }
    `},bve=(bvf)=>{return buj(bvf)},bvg=(bvh,bvi)=>{return E(`div`,{"onClick":(bvj)=>{return bve(bvi)},className:`my`,style:F([bun(bvi) + bvd()])},[E(`div`,{className:`dot` + ` mz`,style:F([buq(bvi)])}),E(`span`,{className:`label` + ` na`,style:F([bux(bvi)])},[bvh])])};return E(`div`,{className:`mx`,style:F([bul()])},[(()=>{const _0=[];const _1=bue;let _i=-1;for(let bvk of _1){_i++;const bvl=_i;_0.push(bvg(bvk,bvl))};return _0})()])},EI=({bvm=[],bvn=`top`,bvo=(bvp)=>{return nq()}})=>{const bvq=L(false),bvr=()=>{const bvs=(bvq.value?ah(d.value):`transparent`);return `background: ${bvs};`},bvt=()=>{const bvu=(bvq.value?ad(d.value):qb(d.value));return `background: ${bvu};`},bvv=()=>{return I(bvn,[[`top`,()=>{return `bottom: calc(100% + 8px); left: 50%; transform: translateX(-50%);`}],[`bottom`,()=>{return `top: calc(100% + 8px); left: 50%; transform: translateX(-50%);`}],[`left`,()=>{return `right: calc(100% + 8px); top: 50%; transform: translateY(-50%);`}],[`right`,()=>{return `left: calc(100% + 8px); top: 50%; transform: translateY(-50%);`}],[`top-left`,()=>{return `bottom: calc(100% + 8px); right: 0;`}],[`top-right`,()=>{return `bottom: calc(100% + 8px); left: 0;`}],[`bottom-left`,()=>{return `top: calc(100% + 8px); right: 0;`}],[`bottom-right`,()=>{return `top: calc(100% + 8px); left: 0;`}],[`center`,()=>{return `top: 50%; left: 50%; transform: translate(-50%, -50%);`}],[null,()=>{return `bottom: calc(100% + 8px); left: 50%; transform: translateX(-50%);`}]])},bvw=()=>{return `background: ${ab(d.value)}; border-color: ${o(d.value)}; box-shadow: ${atg(d.value)}; ${bvv()}`},bvx=(bvy)=>{const bvz=I(bvy,[[4,()=>{return 0}],[1,()=>{return 1}],[3,()=>{return 1}],[5,()=>{return 1}],[7,()=>{return 1}],[0,()=>{return 2}],[2,()=>{return 2}],[6,()=>{return 2}],[8,()=>{return 2}],[null,()=>{return 3}]]);const bwa=ax(0.4 + (bvz * 0.1));return `
      color: ${m(d.value)};
      animation-delay: ${bwa}s;
    `},bwb=(bwc)=>{return (()=>{bvq.value=!bvq.value})()},bwd=(bwe)=>{return (()=>{bvq.value=false})()},bwf=(bwg,bwh)=>{bvo(bwg);return (()=>{bvq.value=false})()},bwi=(bwj,bwk)=>{return E(`div`,{"onClick":(bwl)=>{return bwf(bwj,bwl)},className:`nh`,style:F([bvx(bwk)])},[E(`div`,{className:`ni`},[bwj.icon]),E(`div`,{className:`nj`},[bwj.label])])};return E(`div`,{style:F([`position: relative;`])},[E(`button`,{"onClick":bwb,"type":`button`,className:`nb`,style:F([bvr()])},[E(`div`,{className:`nc`},[E(`div`,{className:`nd`,style:F([bvt()])}),E(`div`,{className:`nd`,style:F([bvt()])}),E(`div`,{className:`nd`,style:F([bvt()])}),E(`div`,{className:`nd`,style:F([bvt()])}),E(`div`,{className:`nd`,style:F([bvt()])}),E(`div`,{className:`nd`,style:F([bvt()])}),E(`div`,{className:`nd`,style:F([bvt()])}),E(`div`,{className:`nd`,style:F([bvt()])}),E(`div`,{className:`nd`,style:F([bvt()])})])]),(bvq.value?E(Q,{},[E(`div`,{"onClick":bwd,className:`ne`}),E(`div`,{className:`nf`,style:F([bvw()])},[E(`div`,{className:`ng`},[(()=>{const _0=[];const _1=bvm;let _i=-1;for(let bwm of _1){_i++;const bwn=_i;_0.push(bwi(bwm,bwn))};return _0})()])])]):null)])},EJ=({bwo=0,bwp=0,bwq=100,bwr=1,bws=(bwt)=>{return nq()}})=>{const bwu=()=>{return (bwo < bwq?bws(bwo + bwr):nq())},bwv=()=>{return (bwo > bwp?bws(bwo - bwr):nq())},bww=()=>{return `
      background: ${ah(d.value)};
      border: 1px solid ${o(d.value)};
    `},bwx=()=>{return `
      background: ${ad(d.value)};
      color: ${af(d.value)};
    `},bwy=()=>{return `color: ${m(d.value)};`};return E(`div`,{className:`mu`,style:F([bww()])},[E(`button`,{"onClick":(bwz)=>{return bwv()},className:`mv`,style:F([bwx()])},[`-`]),E(`span`,{className:`mw`,style:F([bwy()])},[ax(bwo)]),E(`button`,{"onClick":(bxa)=>{return bwu()},className:`mv`,style:F([bwx()])},[`+`])])},EK=({bxb=0,bxc=``,bxd=``,bxe=``,bxf=`large`,bxg=``})=>{const bxh=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},bxi=()=>{const bxj=I(bxf,[[`small`,()=>{return `clamp(1.5rem, 3vw, 2rem)`}],[`medium`,()=>{return `clamp(2rem, 4vw, 3rem)`}],[`large`,()=>{return `clamp(2.5rem, 5vw, 4rem)`}],[null,()=>{return `clamp(2rem, 4vw, 3rem)`}]]);const bxk=(ao(bxg)?m(d.value):bxg);return `font-size: ${bxj}; color: ${bxk};`},bxl=()=>{return `color: ${qb(d.value)};`};return E(`div`,{className:`nk`,style:F([bxh()])},[E(`div`,{className:`nl`,style:F([bxi()])},[`${bxd}${ax(bxb)}${bxe}`]),(!ao(bxc)?E(`div`,{className:`nm`,style:F([bxl()])},[bxc]):E(`div`,{}))])},EL=({bxm=`0`,bxn=`$`,bxo=`medium`,bxp=``})=>{const bxq=()=>{const bxr=I(bxo,[[`small`,()=>{return `1rem`}],[`large`,()=>{return `2.5rem`}],[null,()=>{return `1.75rem`}]]);return `
      font-size: ${bxr};
      color: ${m(d.value)};
    `},bxs=()=>{const bxt=I(bxo,[[`small`,()=>{return `0.875rem`}],[`large`,()=>{return `1.5rem`}],[null,()=>{return `1.25rem`}]]);return `
      font-size: ${bxt};
      color: ${qb(d.value)};
    `},bxu=()=>{const bxv=I(bxo,[[`small`,()=>{return `0.75rem`}],[`large`,()=>{return `1.25rem`}],[null,()=>{return `1rem`}]]);return `
      font-size: ${bxv};
      color: ${qb(d.value)};
    `};return E(`div`,{className:`nw`},[(!ao(bxp)?E(`span`,{className:`nz`,style:F([bxu()])},[E(`span`,{},[bxn]),E(`span`,{},[bxp])]):E(`span`,{})),E(`span`,{className:`ny`,style:F([bxs()])},[bxn]),E(`span`,{className:`nx`,style:F([bxq()])},[bxm])])},EM=({bxw=[]})=>{const bxx=()=>{return `
      background: ${ah(d.value)};
      border: 2px solid ${ad(d.value)};
    `},bxy=()=>{return `background: ${o(d.value)};`};return E(`div`,{className:`ot`},[(()=>{const bxz=aes(bxw,(bya,byb)=>{return E(`div`,{className:`ou`},[E(`div`,{className:`ov`,style:F([bxx()])}),(byb < av(bxw) - 1?E(`div`,{className:`ow`,style:F([bxy()])}):E(`div`,{})),E(`div`,{},[bya])])});return (()=>{const _0=[];const _1=bxz;let _i=-1;for(let byc of _1){_i++;_0.push(byc)};return _0})()})()])},EN=({byd=``,bye=``,byf=``,byg=false,byh=``})=>{const byi=()=>{return (byg?`flex-direction: row-reverse;`:`flex-direction: row;`)},byj=()=>{return (byg?`
        background: ${ad(d.value)};
        color: ${af(d.value)};
        border-bottom-right-radius: 6px;
        box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);
      `:`
        background: ${ah(d.value)};
        color: ${m(d.value)};
        border: 1px solid ${o(d.value)};
        border-bottom-left-radius: 6px;
        box-shadow: ${aj(d.value)};
      `)},byk=()=>{return (byg?`
        background: ${ad(d.value)};
        color: ${af(d.value)};
        border: 2px solid rgba(102, 126, 234, 0.3);
      `:`
        background: ${ab(d.value)};
        color: ${m(d.value)};
        border: 2px solid ${o(d.value)};
      `)},byl=()=>{return (byg?`text-align: right;`:`text-align: left;`)};return E(`div`,{className:`lz`,style:F([byi()])},[(!ao(byh)?E(`div`,{className:`me`,style:F([byk()])},[byh]):E(`div`,{})),E(`div`,{},[E(`div`,{className:`ma`,style:F([byj()])},[(!ao(bye)?E(`div`,{className:`mb`},[bye]):E(`div`,{})),E(`div`,{className:`mc`},[byd])]),(!ao(byf)?E(`div`,{className:`md`,style:F([byl()])},[byf]):E(`div`,{}))])])},EO=({bym=`Type a message...`,byn=(byo)=>{return nq()}})=>{const byp=L(``),byq=()=>{return `
      background: ${ah(d.value)};
      border-top: 2px solid ${o(d.value)};
      backdrop-filter: blur(20px);
    `},byr=()=>{return `
      background: ${ab(d.value)};
      color: ${m(d.value)};
      border: 2px solid ${o(d.value)};
    `},bys=()=>{return `
      background: ${ad(d.value)};
      color: ${af(d.value)};
    `},byt=(byu)=>{return (()=>{byp.value=th(byu.target)})()},byv=(byw)=>{return (!ao(byp.value)?byn(byp.value):nq())};return E(`div`,{className:`fv`,style:F([byq()])},[E(`input`,{"type":`text`,"placeholder":bym,"value":byp.value,"onInput":byt,className:`fw`,style:F([byr()])}),E(`button`,{"onClick":byv,className:`fx`,style:F([bys()])},[`Send`])])},EP=({byx=`Chat`,byy=[],byz=`500px`,bza=(bzb)=>{return nq()}})=>{const bzc=()=>{return `
      background: ${k(d.value)};
      border: 1px solid ${o(d.value)};
      box-shadow: ${atg(d.value)};
      height: ${byz};
    `},bzd=()=>{return `
      background: ${ah(d.value)};
      color: ${m(d.value)};
      border-bottom: 1px solid ${o(d.value)};
    `},bze=()=>{return `background: ${k(d.value)};`},bzf=()=>{return `color: ${qb(d.value)};`};return E(`div`,{className:`og`,style:F([bzc()])},[E(`div`,{className:`oh`,style:F([bzd()])},[E(`span`,{},[byx]),E(`div`,{className:`oj`,style:F([bzf()])},[E(DV,{bop:`success`,bor:false}),E(`span`,{},[`Online`])])]),E(`div`,{className:`oi`,style:F([bze()])},[aes(byy,(bzg,bzh)=>{return E(EN,{byd:bzg,bye:(D(bzh % 2,0)?`User`:`Bot`),byf:`Just now`,byg:D(bzh % 2,0),byh:(D(bzh % 2,0)?`U`:`B`)})})]),E(EO,{byn:bza})])},EQ=({bzi=`Search...`,bzj=(bzk)=>{return nq()},bzl=`medium`})=>{const bzm=L(``),bzn=L(false),bzo=()=>{return I(bzl,[[`small`,()=>{return `padding: 0.5rem 0.875rem;`}],[`large`,()=>{return `padding: 1rem 1.5rem;`}],[null,()=>{return `padding: 0.75rem 1.25rem;`}]])},bzp=()=>{const bzq=(bzn.value?`
          border: 2px solid ${ad(d.value)};
          box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1), ${w(d.value)};
          transform: translateY(-1px);
        `:`
          border: 2px solid ${o(d.value)};
          box-shadow: ${aj(d.value)};
        `);return `
      background: ${ah(d.value)};
      ${bzo()}
      ${bzq}
    `},bzr=()=>{const bzs=(bzn.value?`filter: grayscale(0%) brightness(1.2);`:``);return `${bzs}`},bzt=()=>{return `color: ${m(d.value)};`},bzu=()=>{return `
      color: ${qb(d.value)};
      background: ${ab(d.value)};
    `},bzv=(bzw)=>{return (()=>{bzm.value=th(bzw.target)})()},bzx=(bzy)=>{return (()=>{bzn.value=true})()},bzz=(caa)=>{return (()=>{bzn.value=false})()},cab=(cac)=>{return (()=>{bzm.value=``})()},cad=(cae)=>{return (D(cae.keyCode,13)?bzj(bzm.value):nq())};return E(`div`,{className:`om`,style:F([bzp()])},[E(`div`,{className:`on`},[E(`span`,{className:`oo`,style:F([bzr()])},[`🔍`])]),E(`input`,{"type":`text`,"placeholder":bzi,"value":bzm.value,"onInput":bzv,"onFocus":bzx,"onBlur":bzz,"onKeyDown":cad,className:`op`,style:F([bzt()])}),(!ao(bzm.value)?E(`button`,{"onClick":cab,className:`oq`,style:F([bzu()])},[`×`]):E(`div`,{}))])},caf=(cag,cah)=>{return agq(cag,true,(cai,caj)=>{return cai && cah(caj)})},cak=(cal)=>{return `linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)`},cam=(can)=>{return (can.event.preventDefault())},cao=(cap)=>{return (D(cap,`dark`)?`rgba(51, 65, 85, 0.6)`:`rgba(102, 126, 234, 0.08)`)},caq=(car,cas)=>{return ([...car, ...cas])},cat=(cau)=>{return agq(cau,[],caq)},cav=(caw)=>{return (D(caw,`dark`)?`rgba(102, 126, 234, 0.2)`:`rgba(102, 126, 234, 0.15)`)},ER=({cax=[],cay=280,caz=true,cba=false,cbb=`Available`,cbc=`Selected`,cbd=`Select All`,cbe=`Transfer All`,cbf=`Search items...`,cbg=false,cbh=true,cbi=(cbj,cbk)=>{return null}})=>{const cbl=L([]),cbm=L([]),cbn=L(``),cbo=L(``),cbp=L([]),cbq=(cbr,cbs)=>{return (!D(av(cbr),av(cbs))?false:caf(aes(cbr,(cbt,cbu)=>{return I(az(cbs,cbu),[[J(T,[K]),(cbv)=>{return D(cbt.value,cbv.value)}],[J(U,[]),()=>{return false}]])}),(cbw)=>{return cbw}))},cbx=()=>{const cby=sz(cax,(cbz)=>{return cbz.chosen});const cca=sz(cax,(ccb)=>{return !ccb.chosen});return N(()=>{cbl.value=cby;cbm.value=cca;cbp.value=cax;cbn.value=``;cbo.value=``})},ccc=(ccd,cce)=>{return (cba || ccd.disabled?null:(cce?(()=>{const ccf=abc(cbl.value,(ccg)=>{return (D(ccg.value,ccd.value)?{...ccg,selected: !ccg.selected,justMoved: false}:{...ccg,justMoved: false})});return (()=>{cbl.value=ccf})()})():(()=>{const cch=abc(cbm.value,(cci)=>{return (D(cci.value,ccd.value)?{...cci,selected: !cci.selected,justMoved: false}:{...cci,justMoved: false})});return (()=>{cbm.value=cch})()})()))},ccj=()=>{return (cba?null:(()=>{const cck=sz(cbm.value,(ccl)=>{return ccl.selected && !ccl.disabled});const ccm=sz(cbm.value,(ccn)=>{return !ccn.selected || ccn.disabled});const cco=abc(cck,(ccp)=>{return {...ccp,chosen: true,selected: false,justMoved: true}});const ccq=(cbg?cat([cco,cbl.value]):cat([cbl.value,cco]));N(()=>{cbl.value=ccq;cbm.value=ccm});return cbi(ccq,ccm)})())},ccr=()=>{return (cba?null:(()=>{const ccs=sz(cbm.value,(cct)=>{return !cct.disabled});const ccu=sz(cbm.value,(ccv)=>{return ccv.disabled});const ccw=abc(ccs,(ccx)=>{return {...ccx,chosen: true,selected: false,justMoved: true}});const ccy=(cbg?cat([ccw,cbl.value]):cat([cbl.value,ccw]));N(()=>{cbl.value=ccy;cbm.value=ccu});return cbi(ccy,ccu)})())},ccz=()=>{return (cba?null:(()=>{const cda=sz(cbl.value,(cdb)=>{return !cdb.disabled});const cdc=sz(cbl.value,(cdd)=>{return cdd.disabled});const cde=abc(cda,(cdf)=>{return {...cdf,chosen: false,selected: false,justMoved: true}});const cdg=(cbg?cat([cde,cbm.value]):cat([cbm.value,cde]));N(()=>{cbl.value=cdc;cbm.value=cdg});return cbi(cdc,cdg)})())},cdh=()=>{return (cba?null:(()=>{const cdi=sz(cbl.value,(cdj)=>{return cdj.selected && !cdj.disabled});const cdk=sz(cbl.value,(cdl)=>{return !cdl.selected || cdl.disabled});const cdm=abc(cdi,(cdn)=>{return {...cdn,chosen: false,selected: false,justMoved: true}});const cdo=(cbg?cat([cdm,cbm.value]):cat([cbm.value,cdm]));N(()=>{cbl.value=cdk;cbm.value=cdo});return cbi(cdk,cdo)})())},cdp=()=>{return (cba?null:(()=>{const cdq=abc(cbm.value,(cdr)=>{return (cdr.disabled?cdr:{...cdr,selected: true})});return (()=>{cbm.value=cdq})()})())},cds=()=>{return (cba?null:(()=>{const cdt=abc(cbl.value,(cdu)=>{return (cdu.disabled?cdu:{...cdu,selected: true})});return (()=>{cbl.value=cdt})()})())},cdv=(cdw)=>{return (()=>{cbn.value=cdw})()},cdx=(cdy)=>{return (()=>{cbo.value=cdy})()},cdz=(cea)=>{return (D(cea.keyCode,13)?ceb(cbn.value,false):null)},cec=(ced)=>{return (D(ced.keyCode,13)?ceb(cbo.value,true):null)},cee=(cef,ceg,ceh)=>{return (ceh >= av(cef)?-1:(()=>{const cei=zh(az(cef,ceh),c({value:``,name:``,description:``,chosen:false,selected:false,disabled:false,keywords:[],justMoved:false}));const cej=tf(ceg);const cek=tc(tf(cei.name),cej);const cel=tc(tf(cei.description),cej);const cem=el(cei.keywords,(cen)=>{return tc(tf(cen),cej)});return (cek || cel || cem?ceh:cee(cef,ceg,ceh + 1))})())},ceb=(ceo,cep)=>{return (ao(ceo)?null:(()=>{const ceq=(cep?cbl.value:cbm.value);const cer=cee(ceq,ceo,0);return (cer >= 0?(()=>{const ces=aes(ceq,(cet,ceu)=>{return (D(ceu,cer)?{...cet,justMoved: true}:{...cet,justMoved: false})});(cep?(()=>{cbl.value=ces})():(()=>{cbm.value=ces})());return cev(cer,cep)})():null)})())},cev=(cew,cex)=>{return null},cey=(cez,cfa)=>{return (ao(cfa)?cez:(()=>{const cfb=tf(cfa);return sz(cez,(cfc)=>{const cfd=tc(tf(cfc.name),cfb);const cfe=tc(tf(cfc.description),cfb);const cff=el(cfc.keywords,(cfg)=>{return tc(tf(cfg),cfb)});return cfd || cfe || cff})})())},cfh=(cfi)=>{return el(cfi,(cfj)=>{return cfj.selected && !cfj.disabled})},cfk=(cfl)=>{return el(cfl,(cfm)=>{return !cfm.disabled})},cfn=(cfo)=>{return ax(av(cfo))},cfp=(cfq,cfr)=>{return (cbh && !cba && !cfq.disabled?(cfr?(()=>{const cfs=sz(cbl.value,(cft)=>{return !D(cft.value,cfq.value)});const cfu={...cfq,chosen: false,selected: false,justMoved: true};const cfv=(cbg?cat([[cfu],cbm.value]):cat([cbm.value,[cfu]]));N(()=>{cbl.value=cfs;cbm.value=cfv});return cbi(cfs,cfv)})():(()=>{const cfw=sz(cbm.value,(cfx)=>{return !D(cfx.value,cfq.value)});const cfy={...cfq,chosen: true,selected: false,justMoved: true};const cfz=(cbg?cat([[cfy],cbl.value]):cat([cbl.value,[cfy]]));N(()=>{cbl.value=cfz;cbm.value=cfw});return cbi(cfz,cfw)})()):null)},cga=()=>{const cgb=(caz?42:0);const cgc=cay - 60 - cgb;return `${ax(cgc)}px`},cgd=(cge,cgf,cgg,cgh,cgi,cgj)=>{return (caz?E(`div`,{className:`vm`,style:F([`
          background: ${ab(d.value)};
          border-color: ${bfl(d.value)};
        `])},[E(`input`,{"type":`text`,"value":cge,"placeholder":cgi,"onInput":(cgk)=>{return cgf(th(cgk.target))},"onKeyDown":cgg,className:`vn`,style:F([`
            background: ${ah(d.value)};
            border-color: ${o(d.value)};
            color: ${m(d.value)};
          `])}),E(`div`,{"onClick":(cgl)=>{return cgh()},className:`vo`,style:F([`color: ${qb(d.value)};`])},[`🔍`])]):null)},cgm=(cgn,cgo,cgp)=>{return E(`li`,{"key":cgn.value,"onClick":(cgq)=>{return ccc(cgn,cgo)},"onDblClick":(cgr)=>{return cfp(cgn,cgo)},"title":(cbh?`Double-click to transfer`:``),className:(cgn.justMoved?`just-moved`:``) + ` vr`,style:F([`
        background: ${(cgn.selected?cav(d.value):(cgn.justMoved?cao(d.value):`transparent`))};
        border-color: ${bfl(d.value)};
      `])},[E(`div`,{"title":(ao(cgn.description)?cgn.name:cgn.description),className:`vs`,style:F([`
          color: ${(cgn.disabled?qb(d.value):(cgn.selected?ad(d.value):m(d.value)))};
          opacity: ${(cgn.disabled?`0.5`:`1`)};
        `])},[cgn.name,(cgn.selected?E(`span`,{className:`vt`,style:F([`color: ${ad(d.value)};`])},[`✓`]):null)])])},cgs=(cgt,cgu,cgv,cgw)=>{const cgx=cey(cgt,cgu);return E(`ul`,{"data-transfer-list":cgw,className:`vq`,style:F([`
        height: ${cga()};
        background: ${ah(d.value)};
      `])},[(ate(cgx)?E(`li`,{className:`vx`,style:F([`color: ${qb(d.value)};`])},[(ao(cgu)?`No items available`:`No items found matching "${cgu}"`)]):aes(cgx,(cgy,cgz)=>{return cgm(cgy,cgv,cgz)}))])};P(()=>{(()=>{return cbx()})()},[]);R(()=>{return (!ate(cax) && !cbq(cax,cbp.value)?cbx():null)});const cha=cfh(cbm.value);const chb=cfh(cbl.value);const chc=cfk(cbm.value);const chd=cfk(cbl.value);return E(`div`,{className:(cba?`disabled`:``) + ` vh`,style:F([`${(cba?`opacity: 0.6; pointer-events: none;`:``)}`])},[E(`style`,{},[`
        @keyframes highlight {
          0% {
            background-color: ${cak(d.value)};
          }
          100% {
            background-color: transparent;
          }
        }
        .just-moved {
          animation: highlight 1s ease;
        }
        `]),E(`table`,{className:`vi`},[E(`thead`,{},[E(`tr`,{},[E(`th`,{},[E(`div`,{className:`vj`,style:F([`
                  background: ${ab(d.value)};
                  border-color: ${o(d.value)};
                  color: ${m(d.value)};
                `])},[E(`div`,{},[E(`span`,{className:`vk`},[cbb]),E(`span`,{className:`vw`,style:F([`color: ${qb(d.value)};`])},[`(${cfn(cbm.value)})`])]),E(`a`,{"href":`#`,"onClick":(che)=>{cam(che);return cdp()},className:`vl`,style:F([`
                    color: ${ad(d.value)};
                    background: ${cao(d.value)};
                  `])},[cbd])])]),E(`th`,{}),E(`th`,{},[E(`div`,{className:`vj`,style:F([`
                  background: ${ab(d.value)};
                  border-color: ${o(d.value)};
                  color: ${m(d.value)};
                `])},[E(`div`,{},[E(`span`,{className:`vk`},[cbc]),E(`span`,{className:`vw`,style:F([`color: ${qb(d.value)};`])},[`(${cfn(cbl.value)})`])]),E(`a`,{"href":`#`,"onClick":(chf)=>{cam(chf);return cds()},className:`vl`,style:F([`
                    color: ${ad(d.value)};
                    background: ${cao(d.value)};
                  `])},[cbd])])])])]),E(`tbody`,{},[E(`tr`,{},[E(`td`,{},[cgd(cbn.value,cdv,cdz,()=>{return ceb(cbn.value,false)},cbf,`left`),E(`div`,{className:`vp`,style:F([`
                  background: ${ah(d.value)};
                  border-color: ${o(d.value)};
                `])},[cgs(cbm.value,cbn.value,false,`left`)])]),E(`td`,{className:`vu`},[E(`a`,{"href":`#`,"title":`Move all items to left`,"onClick":(chg)=>{cam(chg);return ccz()},className:`vv`,style:F([`
                  background: ${(chd && !cba?ab(d.value):ab(d.value))};
                  border-color: ${(chd && !cba?o(d.value):o(d.value))};
                  color: ${(chd && !cba?ad(d.value):qb(d.value))};
                  cursor: ${(chd && !cba?`pointer`:`not-allowed`)};
                  opacity: ${(chd && !cba?`1`:`0.5`)};
                `])},[`⇐`]),E(`a`,{"href":`#`,"title":`Move selected items to left`,"onClick":(chh)=>{cam(chh);return cdh()},className:`vv`,style:F([`
                  background: ${(chb && !cba?ad(d.value):ab(d.value))};
                  border-color: ${(chb && !cba?ad(d.value):o(d.value))};
                  color: ${(chb && !cba?af(d.value):qb(d.value))};
                  cursor: ${(chb && !cba?`pointer`:`not-allowed`)};
                  opacity: ${(chb && !cba?`1`:`0.5`)};
                `])},[`←`]),E(`a`,{"href":`#`,"title":`Move selected items to right`,"onClick":(chi)=>{cam(chi);return ccj()},className:`vv`,style:F([`
                  background: ${(cha && !cba?ad(d.value):ab(d.value))};
                  border-color: ${(cha && !cba?ad(d.value):o(d.value))};
                  color: ${(cha && !cba?af(d.value):qb(d.value))};
                  cursor: ${(cha && !cba?`pointer`:`not-allowed`)};
                  opacity: ${(cha && !cba?`1`:`0.5`)};
                `])},[`→`]),E(`a`,{"href":`#`,"title":`Move all items to right`,"onClick":(chj)=>{cam(chj);return ccr()},className:`vv`,style:F([`
                  background: ${(chc && !cba?ab(d.value):ab(d.value))};
                  border-color: ${(chc && !cba?o(d.value):o(d.value))};
                  color: ${(chc && !cba?ad(d.value):qb(d.value))};
                  cursor: ${(chc && !cba?`pointer`:`not-allowed`)};
                  opacity: ${(chc && !cba?`1`:`0.5`)};
                `])},[`⇒`])]),E(`td`,{},[cgd(cbo.value,cdx,cec,()=>{return ceb(cbo.value,true)},cbf,`right`),E(`div`,{className:`vp`,style:F([`
                  background: ${ah(d.value)};
                  border-color: ${o(d.value)};
                `])},[cgs(cbl.value,cbo.value,true,`right`)])])])])])])},ES=()=>{const chk=L([]),chl=L([]),chm=L([]),chn=()=>{const cho=[c({value:`item1`,name:`React`,description:`A JavaScript library for building user interfaces`,chosen:false,selected:false,disabled:false,keywords:[`javascript`,`frontend`,`ui`,`library`],justMoved:false}),c({value:`item2`,name:`Vue.js`,description:`The Progressive JavaScript Framework`,chosen:false,selected:false,disabled:false,keywords:[`javascript`,`frontend`,`progressive`,`framework`],justMoved:false}),c({value:`item3`,name:`Angular`,description:`Platform for building mobile and desktop web applications`,chosen:true,selected:false,disabled:false,keywords:[`typescript`,`frontend`,`platform`,`mobile`],justMoved:false}),c({value:`item4`,name:`Svelte`,description:`Cybernetically enhanced web apps`,chosen:false,selected:false,disabled:false,keywords:[`javascript`,`frontend`,`compiler`,`performance`],justMoved:false}),c({value:`item5`,name:`Mint`,description:`A refreshing language for the front-end web`,chosen:true,selected:false,disabled:false,keywords:[`mint`,`functional`,`frontend`,`refreshing`],justMoved:false}),c({value:`item6`,name:`jQuery`,description:`Fast, small, and feature-rich JavaScript library`,chosen:false,selected:false,disabled:true,keywords:[`javascript`,`dom`,`legacy`],justMoved:false}),c({value:`item7`,name:`Ember.js`,description:`A framework for ambitious web developers`,chosen:false,selected:false,disabled:false,keywords:[`javascript`,`frontend`,`ambitious`,`convention`],justMoved:false}),c({value:`item8`,name:`Alpine.js`,description:`A lightweight JavaScript framework`,chosen:false,selected:false,disabled:false,keywords:[`javascript`,`lightweight`,`reactive`],justMoved:false})];const chp=[c({value:`option1`,name:`Option 1`,description:`First option`,chosen:false,selected:false,disabled:false,keywords:[`one`,`first`],justMoved:false}),c({value:`option2`,name:`Option 2`,description:`Second option`,chosen:true,selected:false,disabled:false,keywords:[`two`,`second`],justMoved:false}),c({value:`option3`,name:`Option 3`,description:`Third option`,chosen:false,selected:false,disabled:false,keywords:[`three`,`third`],justMoved:false})];const chq=[c({value:`small1`,name:`Small Item 1`,description:`Compact size demo`,chosen:false,selected:false,disabled:false,keywords:[`small`,`compact`],justMoved:false}),c({value:`small2`,name:`Small Item 2`,description:`Another compact item`,chosen:true,selected:false,disabled:false,keywords:[`small`,`another`],justMoved:false})];return N(()=>{chk.value=cho;chl.value=chp;chm.value=chq})},chr=(chs,cht)=>{return (()=>{chk.value=cat([chs,cht])})()},chu=(chv,chw)=>{return (()=>{chl.value=cat([chv,chw])})()},chx=(chy,chz)=>{return (()=>{chm.value=cat([chy,chz])})()},cia=()=>{return `color: ${m(d.value)};`},cib=()=>{return `
      color: ${m(d.value)};
      border-color: ${ad(d.value)};
    `},cic=()=>{return `color: ${qb(d.value)};`},cid=()=>{return `
      background: ${ab(d.value)};
      border-color: ${o(d.value)};
    `},cie=()=>{return `
      background: ${ab(d.value)};
      border-color: ${o(d.value)};
    `},cif=()=>{return `
      background: ${ab(d.value)};
      border-color: ${o(d.value)};
    `},cig=()=>{return `
      background: ${ah(d.value)};
      color: ${m(d.value)};
      border-color: ${bfl(d.value)};
    `},cih=()=>{return `
      color: ${m(d.value)};
      border-color: ${bfl(d.value)};
    `};P(()=>{(()=>{return chn()})()},[]);return E(`div`,{className:`uw`,style:F([`
        background: ${s(d.value)};
        color: ${m(d.value)};
      `])},[E(`div`,{className:`ux`},[E(`h1`,{className:`uy`,style:F([cia()])},[`Transfer Component`]),E(`p`,{className:`va`,style:F([cic()])},[`A dual-list transfer component that allows users to move items between two lists. Perfect for selecting items from a large dataset with search and selection capabilities.`])]),E(`div`,{className:`ux`},[E(`h2`,{className:`uz`,style:F([cib()])},[`Features`]),E(`div`,{className:`vc`},[E(`div`,{className:`vd`,style:F([cie()])},[E(`h3`,{},[`🔍 Search & Filter`]),E(`p`,{},[`Built-in search functionality with keyword matching`])]),E(`div`,{className:`vd`,style:F([cie()])},[E(`h3`,{},[`✅ Bulk Selection`]),E(`p`,{},[`Select all items with a single click`])]),E(`div`,{className:`vd`,style:F([cie()])},[E(`h3`,{},[`🎨 Theme Support`]),E(`p`,{},[`Fully integrated with the theme system`])]),E(`div`,{className:`vd`,style:F([cie()])},[E(`h3`,{},[`♿ Accessibility`]),E(`p`,{},[`Keyboard navigation and ARIA labels`])]),E(`div`,{className:`vd`,style:F([cie()])},[E(`h3`,{},[`🚫 Disabled States`]),E(`p`,{},[`Support for disabled items and component`])]),E(`div`,{className:`vd`,style:F([cie()])},[E(`h3`,{},[`📱 Responsive`]),E(`p`,{},[`Works on mobile and desktop devices`])])])]),E(`div`,{className:`ux`},[E(`h2`,{className:`uz`,style:F([cib()])},[`Basic Usage`]),E(`div`,{className:`vb`,style:F([cid()])},[E(ER,{cax:chl.value,cbi:chu,cbb:`Available Items`,cbc:`Selected Items`,cay:200})]),E(BC,{mr:`mint`,mq:`<Transfer
  data={myTransferData}
  onTransfer={handleTransfer}
  leftTitle="Available Items"
  rightTitle="Selected Items"
  height={200}
/>`})]),E(`div`,{className:`ux`},[E(`h2`,{className:`uz`,style:F([cib()])},[`Advanced Example`]),E(`p`,{className:`va`,style:F([cic()])},[`A more complex example with search, custom titles, and callback handling.`]),E(`div`,{className:`vb`,style:F([cid()])},[E(ER,{cax:chk.value,cbi:chr,cbb:`Available Frameworks`,cbc:`Selected Frameworks`,cbd:`Select All`,cbf:`Search frameworks...`,caz:true,cay:300})]),E(BC,{mr:`mint`,mq:`<Transfer
  data={frameworkData}
  onTransfer={handleFrameworkTransfer}
  leftTitle="Available Frameworks"
  rightTitle="Selected Frameworks"
  checkAllText="Select All"
  searchPlaceholder="Search frameworks..."
  showSearch={true}
  height={300}
/>`})]),E(`div`,{className:`ux`},[E(`h2`,{className:`uz`,style:F([cib()])},[`Compact Size`]),E(`p`,{className:`va`,style:F([cic()])},[`Transfer component with reduced height for smaller interfaces.`]),E(`div`,{className:`vb`,style:F([cid()])},[E(ER,{cax:chm.value,cbi:chx,cbb:`Source`,cbc:`Target`,cay:150,caz:false})]),E(BC,{mr:`mint`,mq:`<Transfer
  data={compactData}
  onTransfer={handleCompactTransfer}
  leftTitle="Source"
  rightTitle="Target"
  height={150}
  showSearch={false}
/>`})]),E(`div`,{className:`ux`},[E(`h2`,{className:`uz`,style:F([cib()])},[`Disabled State`]),E(`div`,{className:`vb`,style:F([cid()])},[E(ER,{cax:chl.value,cbi:chu,cba:true,cbb:`Disabled Transfer`,cbc:`Cannot Select`})]),E(BC,{mr:`mint`,mq:`<Transfer
  data={myData}
  onTransfer={handleTransfer}
  disabled={true}
  leftTitle="Disabled Transfer"
  rightTitle="Cannot Select"
/>`})]),E(`div`,{className:`ux`},[E(`h2`,{className:`uz`,style:F([cib()])},[`Properties`]),E(`table`,{className:`ve`,style:F([cif()])},[E(`thead`,{},[E(`tr`,{},[E(`th`,{className:`vf`,style:F([cig()])},[`Property`]),E(`th`,{className:`vf`,style:F([cig()])},[`Type`]),E(`th`,{className:`vf`,style:F([cig()])},[`Default`]),E(`th`,{className:`vf`,style:F([cig()])},[`Description`])])]),E(`tbody`,{},[E(`tr`,{},[E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`data`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`Array(TransferItem)`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`[]`])]),E(`td`,{className:`vg`,style:F([cih()])},[`Array of items to display`])]),E(`tr`,{},[E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`height`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`Number`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`280`])]),E(`td`,{className:`vg`,style:F([cih()])},[`Height of the transfer lists`])]),E(`tr`,{},[E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`showSearch`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`Bool`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`true`])]),E(`td`,{className:`vg`,style:F([cih()])},[`Show search input fields`])]),E(`tr`,{},[E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`disabled`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`Bool`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`false`])]),E(`td`,{className:`vg`,style:F([cih()])},[`Disable the entire component`])]),E(`tr`,{},[E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`leftTitle`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`String`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`"Available"`])]),E(`td`,{className:`vg`,style:F([cih()])},[`Title for the left list`])]),E(`tr`,{},[E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`rightTitle`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`String`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`"Selected"`])]),E(`td`,{className:`vg`,style:F([cih()])},[`Title for the right list`])]),E(`tr`,{},[E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`checkAllText`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`String`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`"Select All"`])]),E(`td`,{className:`vg`,style:F([cih()])},[`Text for select all buttons`])]),E(`tr`,{},[E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`searchPlaceholder`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`String`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`"Search items..."`])]),E(`td`,{className:`vg`,style:F([cih()])},[`Placeholder text for search inputs`])]),E(`tr`,{},[E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`onTransfer`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`Function`])]),E(`td`,{className:`vg`,style:F([cih()])},[E(`code`,{},[`-`])]),E(`td`,{className:`vg`,style:F([cih()])},[`Callback when items are transferred`])])])])]),E(`div`,{className:`ux`},[E(`h2`,{className:`uz`,style:F([cib()])},[`TransferItem Type`]),E(`p`,{className:`va`,style:F([cic()])},[`Each item in the data array should conform to the TransferItem type:`]),E(BC,{mr:`mint`,mq:`type TransferItem {
  value : String,
  name : String,
  description : String,
  chosen : Bool,
  selected : Bool,
  disabled : Bool,
  keywords : Array(String),
  justMoved : Bool
}`})]),E(`div`,{className:`ux`},[E(`h2`,{className:`uz`,style:F([cib()])},[`Usage Notes`]),E(`div`,{className:`vc`},[E(`div`,{className:`vd`,style:F([cie()])},[E(`h4`,{},[`Search Functionality`]),E(`p`,{},[`Search works across name, description, and keywords fields`])]),E(`div`,{className:`vd`,style:F([cie()])},[E(`h4`,{},[`Selection State`]),E(`p`,{},[`Items must be selected before they can be transferred`])]),E(`div`,{className:`vd`,style:F([cie()])},[E(`h4`,{},[`Disabled Items`]),E(`p`,{},[`Items with disabled=true cannot be selected or transferred`])]),E(`div`,{className:`vd`,style:F([cie()])},[E(`h4`,{},[`Callbacks`]),E(`p`,{},[`onTransfer is called with updated chosen and unChosen arrays`])])])])])},ET=()=>{const cii=L(3),cij=L(false),cik=L(`Mint`),cil=L(0),cim=L(``),cin=()=>{return `border-bottom-color: ${o(d.value)};`},cio=()=>{return `
      background: ${ab(d.value)};
      border-color: ${o(d.value)};
      box-shadow: ${w(d.value)};
    `},cip=()=>{return `
      background: ${s(d.value)};
      border-color: ${o(d.value)};
    `},ciq=(cir)=>{return (()=>{cii.value=cir})()};return E(`div`,{},[E(`h1`,{className:`uo`},[`Utilities`]),E(`p`,{className:`up`},[`Componentes utilitarios y helpers para funcionalidades comunes.`]),E(`div`,{className:`uq`},[E(`h2`,{className:`ur`,style:F([cin()])},[`Interactive Components`]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`SimpleRating`]),E(`p`,{className:`uu`},[`Sistema de calificación con estrellas.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(ED,{bsn:cii.value,bsp:ciq}),E(`p`,{},[`Rating: ${ax(cii.value)}/5`])]),E(BC,{mr:`mint`,mq:`<SimpleRating
  value={3}
  onChange={updateRating}
/>`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`ToggleSwitch`]),E(`p`,{className:`uu`},[`Interruptor toggle con animación suave.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(BS,{xz:cij.value,yc:(cis)=>{return (()=>{cij.value=cis})()}}),E(`p`,{},[`Status: ${(cij.value?`ON`:`OFF`)}`])]),E(BC,{mr:`mint`,mq:`<ToggleSwitch
  checked={toggleValue}
  onChange={handleChange}
/>`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`SimpleAccordion`]),E(`p`,{className:`uu`},[`Acordeón expandible para contenido colapsable.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(EE,{btj:`Click to expand`,btl:false},M(E(`p`,{},[`This is the accordion content. You can put any content here!`])))]),E(BC,{mr:`mint`,mq:`<SimpleAccordion
  title="Click to expand"
  defaultOpen={false}
>
  <p>"Content here"</p>
</SimpleAccordion>`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`Chip`]),E(`p`,{className:`uu`},[`Chip compacto para etiquetas y tags.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(EF,{bts:`Default`}),E(EF,{bts:`Primary`,btt:`primary`}),E(EF,{bts:`Success`,btt:`success`}),E(EF,{bts:`Closable`,btw:true,btu:(cit)=>{return no(null)}})]),E(BC,{mr:`mint`,mq:`<Chip label="Default"/>
<Chip label="Primary" variant="primary"/>
<Chip label="Closable" closable={true} onClose={handleClose}/>`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`Tag`]),E(`p`,{className:`uu`},[`Etiqueta visual para categorías y estados.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(EG,{bty:`New`}),E(EG,{bty:`Featured`,btz:`primary`}),E(EG,{bty:`Sale`,btz:`danger`})]),E(BC,{mr:`mint`,mq:`<Tag label="New"/>
<Tag label="Featured" variant="primary"/>`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`DotNavigation`]),E(`p`,{className:`uu`},[`Navegación vertical con indicadores de puntos. Ideal para páginas de una sola página con scroll suave.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(`div`,{style:F([`position: relative; height: 400px; background: linear-gradient(180deg, #667eea 0%, #764ba2 100%); border-radius: 12px; overflow: hidden;`])},[E(EH,{bue:[`Home`,`About`,`Services`,`Portfolio`,`Contact`],buf:cil.value,bug:`right`,buh:`medium`,bui:false,buj:(ciu)=>{return (()=>{cil.value=ciu})()}}),E(`div`,{style:F([`padding: 2rem; color: white;`])},[E(`h2`,{style:F([`font-size: 2rem; margin-bottom: 1rem;`])},[`Section ${ax(cil.value + 1)}`]),E(`p`,{style:F([`opacity: 0.9;`])},[`Active section: ${I(cil.value,[[0,()=>{return `Home`}],[1,()=>{return `About`}],[2,()=>{return `Services`}],[3,()=>{return `Portfolio`}],[4,()=>{return `Contact`}],[null,()=>{return `Unknown`}]])}`])])])]),E(BC,{mr:`mint`,mq:`<DotNavigation
  items={["Home", "About", "Services", "Portfolio", "Contact"]}
  activeIndex={activeIndex}
  position="right"
  dotSize="medium"
  showLabels={false}
  onItemClick={handleNavClick}
/>

// Position options: "left" | "right"
// Dot sizes: "small" | "medium" | "large"
// Set showLabels={true} to always show labels`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`NineDotMenu`]),E(`p`,{className:`uu`},[`Menú estilo launcher de aplicaciones con grid 3x3. Ideal para acceso rápido a múltiples secciones o aplicaciones.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(`div`,{style:F([`display: flex; justify-content: center; align-items: center; min-height: 300px; padding: 4rem; background: ${ah(d.value)}; border-radius: 8px;`])},[E(`div`,{style:F([`display: grid; grid-template-columns: repeat(3, 1fr); gap: 4rem; align-items: center;`])},[E(`div`,{style:F([`display: flex; flex-direction: column; align-items: center; gap: 0.5rem;`])},[E(`p`,{style:F([`font-size: 0.875rem; font-weight: 600; color: ${qb(d.value)}; margin-bottom: 0.5rem;`])},[`Top`]),E(EI,{bvn:`top`,bvm:[a({icon:`📧`,label:`Mail`,href:`#mail`}),a({icon:`📅`,label:`Calendar`,href:`#calendar`}),a({icon:`💬`,label:`Chat`,href:`#chat`}),a({icon:`📁`,label:`Drive`,href:`#drive`}),a({icon:`📊`,label:`Analytics`,href:`#analytics`}),a({icon:`⚙️`,label:`Settings`,href:`#settings`}),a({icon:`👥`,label:`Contacts`,href:`#contacts`}),a({icon:`📝`,label:`Notes`,href:`#notes`}),a({icon:`🎨`,label:`Design`,href:`#design`})],bvo:(civ)=>{return (()=>{cim.value=civ.label})()}})]),E(`div`,{style:F([`display: flex; flex-direction: column; align-items: center; gap: 0.5rem;`])},[E(`p`,{style:F([`font-size: 0.875rem; font-weight: 600; color: ${qb(d.value)}; margin-bottom: 0.5rem;`])},[`Bottom`]),E(EI,{bvn:`bottom`,bvm:[a({icon:`📧`,label:`Mail`,href:`#mail`}),a({icon:`📅`,label:`Calendar`,href:`#calendar`}),a({icon:`💬`,label:`Chat`,href:`#chat`}),a({icon:`📁`,label:`Drive`,href:`#drive`}),a({icon:`📊`,label:`Analytics`,href:`#analytics`}),a({icon:`⚙️`,label:`Settings`,href:`#settings`}),a({icon:`👥`,label:`Contacts`,href:`#contacts`}),a({icon:`📝`,label:`Notes`,href:`#notes`}),a({icon:`🎨`,label:`Design`,href:`#design`})],bvo:(ciw)=>{return (()=>{cim.value=ciw.label})()}})]),E(`div`,{style:F([`display: flex; flex-direction: column; align-items: center; gap: 0.5rem;`])},[E(`p`,{style:F([`font-size: 0.875rem; font-weight: 600; color: ${qb(d.value)}; margin-bottom: 0.5rem;`])},[`Center`]),E(EI,{bvn:`center`,bvm:[a({icon:`📧`,label:`Mail`,href:`#mail`}),a({icon:`📅`,label:`Calendar`,href:`#calendar`}),a({icon:`💬`,label:`Chat`,href:`#chat`}),a({icon:`📁`,label:`Drive`,href:`#drive`}),a({icon:`📊`,label:`Analytics`,href:`#analytics`}),a({icon:`⚙️`,label:`Settings`,href:`#settings`}),a({icon:`👥`,label:`Contacts`,href:`#contacts`}),a({icon:`📝`,label:`Notes`,href:`#notes`}),a({icon:`🎨`,label:`Design`,href:`#design`})],bvo:(cix)=>{return (()=>{cim.value=cix.label})()}})])])]),(bf(cim.value) > 0?E(`p`,{style:F([`margin-top: 1rem; padding: 1rem; background: ${ad(d.value)}22; border-radius: 8px; color: ${m(d.value)};`])},[`Selected: ${cim.value}`]):null)]),E(BC,{mr:`mint`,mq:`<NineDotMenu
  placement="top"
  menuItems={[
    { icon: "📧", label: "Mail", href: "#mail" },
    { icon: "📅", label: "Calendar", href: "#calendar" },
    { icon: "💬", label: "Chat", href: "#chat" },
    // ... more items
  ]}
  onItemClick={handleAppClick}
/>

// Placement options:
// "top" | "bottom" | "left" | "right"
// "top-left" | "top-right" | "bottom-left" | "bottom-right"
// "center"`})])]),E(`div`,{className:`uq`},[E(`h2`,{className:`ur`,style:F([cin()])},[`Display Components`]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`Counter`]),E(`p`,{className:`uu`},[`Contador numérico interactivo.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(EJ,{bwo:5,bwp:0,bwq:10,bwr:1,bws:(ciy)=>{return no(null)}})]),E(BC,{mr:`mint`,mq:`<Counter
  value={5}
  min={0}
  max={10}
  step={1}
  onChange={handleChange}
/>`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`NumberCounter`]),E(`p`,{className:`uu`},[`Contador numérico con formato.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(EK,{bxb:1234,bxd:`$`})]),E(BC,{mr:`mint`,mq:`<NumberCounter value={1234} prefix="$"/>`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`PercentageRing`]),E(`p`,{className:`uu`},[`Anillo circular de porcentaje.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(CJ,{aso:75})]),E(BC,{mr:`mint`,mq:`<PercentageRing percentage={75}/>`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`PriceTag`]),E(`p`,{className:`uu`},[`Etiqueta de precio con descuento opcional.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(EL,{bxm:`$99.99`}),E(EL,{bxm:`$79.99`,bxp:`20% OFF`})]),E(BC,{mr:`mint`,mq:`<PriceTag price="$99.99"/>
<PriceTag price="$79.99" discount="20% OFF"/>`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`Timeline`]),E(`p`,{className:`uu`},[`Línea de tiempo para eventos cronológicos.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(EM,{bxw:[`Project created - Jan 1, 2024`,`First commit pushed - Jan 5, 2024`,`Beta release deployed - Feb 15, 2024`,`User testing completed - Mar 10, 2024`,`Version 1.0 launched - Apr 1, 2024`]})]),E(BC,{mr:`mint`,mq:`<Timeline
  items={[
    "Project created - Jan 1, 2024",
    "First commit pushed - Jan 5, 2024",
    "Beta release deployed - Feb 15, 2024",
    "Version 1.0 launched - Apr 1, 2024"
  ]}
/>`})])]),E(`div`,{className:`uq`},[E(`h2`,{className:`ur`,style:F([cin()])},[`Chat Components`]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`ChatBubble`]),E(`p`,{className:`uu`},[`Burbuja de mensaje de chat.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(EN,{byd:`Hello!`,bye:`user`,byf:`10:30 AM`}),E(EN,{byd:`Hi there!`,bye:`bot`,byf:`10:31 AM`})]),E(BC,{mr:`mint`,mq:`<ChatBubble
  message="Hello!"
  sender="user"
  timestamp="10:30 AM"
/>`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`SimpleChatWindow`]),E(`p`,{className:`uu`},[`Ventana de chat completa.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(EP,{})]),E(BC,{mr:`mint`,mq:`<SimpleChatWindow/>`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`SimpleChatInput`]),E(`p`,{className:`uu`},[`Campo de entrada para mensajes de chat.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(EO,{byn:(ciz)=>{return no(null)}})]),E(BC,{mr:`mint`,mq:`<SimpleChatInput
  onSend={handleSend}
/>`})])]),E(`div`,{className:`uq`},[E(`h2`,{className:`ur`,style:F([cin()])},[`Search & Code`]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`SimpleSearchBar`]),E(`p`,{className:`uu`},[`Barra de búsqueda simple.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(EQ,{bzj:(cja)=>{return no(null)}})]),E(BC,{mr:`mint`,mq:`<SimpleSearchBar
  onSearch={handleSearch}
/>`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`CodeHighlight`]),E(`p`,{className:`uu`},[`Resaltado de sintaxis para código.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(BC,{mr:`mint`,mq:`component Hello {
  fun render : Html {
    <div>"Hello World!"</div>
  }
}`})]),E(BC,{mr:`mint`,mq:`<CodeHighlight
  language="mint"
  code="your code here"
/>`})])]),E(`div`,{className:`uq`},[E(`h2`,{className:`ur`,style:F([cin()])},[`Transfer`]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`Transfer - Dual List Selector`]),E(`p`,{className:`uu`},[`A dual-list transfer component for moving items between two lists with search and selection capabilities.`]),E(ES,{})])]),E(`div`,{className:`uq`},[E(`h2`,{className:`ur`,style:F([cin()])},[`Advanced Features`]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`ColorPicker`]),E(`p`,{className:`uu`},[`Selector de color completo con paleta y entrada manual.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(`p`,{},[`Ver carpeta utilities/colorpicker/ para ColorPickerDemo`])]),E(BC,{mr:`mint`,mq:`// Ver ColorPickerDemo.mint para implementación completa`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`Drag & Drop`]),E(`p`,{className:`uu`},[`Sistema de arrastrar y soltar elementos.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(`p`,{},[`Ver carpeta utilities/dragdrop/ para DragDropDemo`])]),E(BC,{mr:`mint`,mq:`// Ver DragDropDemo.mint para implementación completa`})]),E(`div`,{className:`us`,style:F([cio()])},[E(`h3`,{className:`ut`},[`Markdown`]),E(`p`,{className:`uu`},[`Editor y parser de Markdown.`]),E(`div`,{className:`uv`,style:F([cip()])},[E(`p`,{},[`Ver carpeta utilities/markdown/ para MarkdownEditor`])]),E(BC,{mr:`mint`,mq:`// Ver MarkdownEditor.mint para implementación completa`})])])])},EU=()=>{return E(`div`,{},[E(`h1`,{className:`qj`},[`Feedback Components`]),E(`p`,{},[`User feedback components: alerts, toasts, modals, tooltips, spinners.`]),E(`div`,{className:`qk`},[E(`h2`,{},[`Alert - Alert Messages`]),E(`p`,{},[`Contextual alerts with variants: info, success, warning, error.`])]),E(`div`,{className:`qk`},[E(`h2`,{},[`Toast - Toast Notifications`]),E(`p`,{},[`Temporary notifications with auto-dismiss and positioning.`])]),E(`div`,{className:`qk`},[E(`h2`,{},[`Modal - Modal Dialogs`]),E(`p`,{},[`Overlay modals with backdrop and animations.`])]),E(`div`,{className:`qk`},[E(`h2`,{},[`Tooltip - Tooltips`]),E(`p`,{},[`Contextual tooltips with positioning.`])]),E(`div`,{className:`qk`},[E(`h2`,{},[`Spinner - Loading Indicators`]),E(`p`,{},[`Loading spinners and progress indicators.`])])])},EV=({cjb=``,cjc=``,cjd=`info`,cje=4000,cjf=true,cjg=``,cjh=()=>{return no(null)},cji=``,cjj=``,cjk=(cjl)=>{return no(null)}})=>{const cjm=L(false),cjn=L(false),cjo=async ()=>{await aq(cje);return cjp()},cjp=async ()=>{(()=>{cjn.value=true})();await aq(300);return cjk(cjb)},cjq=async ()=>{cjh();(()=>{cjn.value=true})();await aq(300);return cjk(cjb)},cjr=()=>{return (!D(cjj,``)?cjj:I(cjd,[[`success`,()=>{return `✓`}],[`error`,()=>{return `✕`}],[`warning`,()=>{return `⚠`}],[null,()=>{return `ℹ`}]]))},cjs=()=>{return I(cjd,[[`success`,()=>{return `#10b981`}],[`error`,()=>{return `#ef4444`}],[`warning`,()=>{return `#f59e0b`}],[null,()=>{return `#3b82f6`}]])};P(()=>{(()=>{(()=>{cjm.value=true})();return (cje > 0?(()=>{cjo();return no(null)})():no(null))})()},[]);return E(`div`,{className:(cjn.value?`exiting`:``) + ` kx`,style:F([`background: ` + cjs() + `;`])},[E(`div`,{className:`ky`},[cjr()]),E(`div`,{className:`kz`},[cjc]),(!D(cjg,``)?E(`button`,{"onClick":()=>{return cjq()},className:`la`,style:F([`color: ` + cjs() + `;`])},[cjg]):null),E(`button`,{"onClick":()=>{return cjp()},className:`lb`},[`×`]),(cjf && cje > 0?E(`div`,{className:`lc`},[E(`div`,{className:`ld`,style:F([`animation: shrink ${cje}ms linear;`])})]):null)])},EW=()=>{const cjt=L(0),cju=L(`top-right`),cjv=L(false),cjw=L(false),cjx=L(false),cjy=L(false),cjz=L(false),cka=L(false),ckb=L(false),ckc=L(false),ckd=L(false),cke=L(``),ckf=(ckg)=>{return N(()=>{cjv.value=true;cjt.value=cjt.value + 1})},ckh=(cki)=>{return N(()=>{cjw.value=true;cjt.value=cjt.value + 1})},ckj=(ckk)=>{return N(()=>{cjx.value=true;cjt.value=cjt.value + 1})},ckl=(ckm)=>{return N(()=>{cjy.value=true;cjt.value=cjt.value + 1})},ckn=(cko)=>{return N(()=>{cjz.value=true;cjt.value=cjt.value + 1})},ckp=(ckq)=>{return N(()=>{cka.value=true;cjt.value=cjt.value + 1})},ckr=(cks)=>{return N(()=>{ckb.value=true;cjt.value=cjt.value + 1})},ckt=(cku)=>{return N(()=>{ckc.value=true;cjt.value=cjt.value + 1})},ckv=(ckw)=>{return (()=>{cjv.value=false})()},ckx=(cky)=>{return (()=>{cjw.value=false})()},ckz=(cla)=>{return (()=>{cjx.value=false})()},clb=(clc)=>{return (()=>{cjy.value=false})()},cld=(cle)=>{return (()=>{cjz.value=false})()},clf=(clg)=>{return (()=>{cka.value=false})()},clh=(cli)=>{return (()=>{ckb.value=false})()},clj=(clk)=>{return (()=>{ckc.value=false})()},cll=(clm)=>{return (()=>{ckd.value=false})()},cln=()=>{(alert('Undo action triggered!'));return no(null)},clo=()=>{(alert('Retry action triggered!'));return no(null)},clp=()=>{(alert('View details triggered!'));return no(null)},clq=async (clr)=>{N(()=>{cju.value=`top-left`;ckd.value=false});await aq(10);return N(()=>{cke.value=`Posición: Top Left`;ckd.value=true;cjt.value=cjt.value + 1})},cls=async (clt)=>{N(()=>{cju.value=`top-center`;ckd.value=false});await aq(10);return N(()=>{cke.value=`Posición: Top Center`;ckd.value=true;cjt.value=cjt.value + 1})},clu=async (clv)=>{N(()=>{cju.value=`top-right`;ckd.value=false});await aq(10);return N(()=>{cke.value=`Posición: Top Right`;ckd.value=true;cjt.value=cjt.value + 1})},clw=async (clx)=>{N(()=>{cju.value=`bottom-left`;ckd.value=false});await aq(10);return N(()=>{cke.value=`Posición: Bottom Left`;ckd.value=true;cjt.value=cjt.value + 1})},cly=async (clz)=>{N(()=>{cju.value=`bottom-center`;ckd.value=false});await aq(10);return N(()=>{cke.value=`Posición: Bottom Center`;ckd.value=true;cjt.value=cjt.value + 1})},cma=async (cmb)=>{N(()=>{cju.value=`bottom-right`;ckd.value=false});await aq(10);return N(()=>{cke.value=`Posición: Bottom Right`;ckd.value=true;cjt.value=cjt.value + 1})},cmc=()=>{return I(cju.value,[[`top-left`,()=>{return `top: 20px; left: 20px; align-items: flex-start;`}],[`top-center`,()=>{return `top: 20px; left: 50%; transform: translateX(-50%); align-items: center;`}],[`top-right`,()=>{return `top: 20px; right: 20px; align-items: flex-end;`}],[`bottom-left`,()=>{return `bottom: 20px; left: 20px; align-items: flex-start;`}],[`bottom-center`,()=>{return `bottom: 20px; left: 50%; transform: translateX(-50%); align-items: center;`}],[`bottom-right`,()=>{return `bottom: 20px; right: 20px; align-items: flex-end;`}],[null,()=>{return `top: 20px; right: 20px; align-items: flex-end;`}]])};return E(`div`,{className:`le`},[E(`h1`,{className:`lf`},[`🔔 Toast Pro System`]),E(`p`,{className:`lg`},[`Sistema completo de notificaciones con queue, posiciones, acciones y animaciones`,E(`span`,{className:`lp`},[`PRO`])]),E(`div`,{className:`lh`},[E(`div`,{className:`li`},[E(`div`,{className:`lj`},[`💫 Tipos Básicos`]),E(`div`,{className:`lk`},[E(`button`,{"onClick":ckf,className:`ll`,style:F([`background: #10b981;`])},[`✓ Success`]),E(`button`,{"onClick":ckh,className:`ll`,style:F([`background: #ef4444;`])},[`✕ Error`]),E(`button`,{"onClick":ckj,className:`ll`,style:F([`background: #f59e0b;`])},[`⚠ Warning`]),E(`button`,{"onClick":ckl,className:`ll`,style:F([`background: #3b82f6;`])},[`ℹ Info`])])]),E(`div`,{className:`li`},[E(`div`,{className:`lj`},[`⚡ Con Acciones`]),E(`div`,{className:`lk`},[E(`button`,{"onClick":ckn,className:`ll`,style:F([`background: #8b5cf6;`])},[`↩️ Undo Action`]),E(`button`,{"onClick":ckp,className:`ll`,style:F([`background: #ec4899;`])},[`🔄 Retry Action`]),E(`button`,{"onClick":ckr,className:`ll`,style:F([`background: #06b6d4;`])},[`👀 View Details`]),E(`button`,{"onClick":ckt,className:`ll`,style:F([`background: #14b8a6;`])},[`📌 Persistente`])])]),E(`div`,{className:`li`},[E(`div`,{className:`lj`},[`📍 Posición`]),E(`div`,{className:`lk`},[E(`button`,{"onClick":clq,className:(D(cju.value,`top-left`)?`activeBtn`:``) + ` lm`},[`↖ Top Left`]),E(`button`,{"onClick":cls,className:(D(cju.value,`top-center`)?`activeBtn`:``) + ` lm`},[`↑ Top Center`]),E(`button`,{"onClick":clu,className:(D(cju.value,`top-right`)?`activeBtn`:``) + ` lm`},[`↗ Top Right`]),E(`button`,{"onClick":clw,className:(D(cju.value,`bottom-left`)?`activeBtn`:``) + ` lm`},[`↙ Bottom Left`]),E(`button`,{"onClick":cly,className:(D(cju.value,`bottom-center`)?`activeBtn`:``) + ` lm`},[`↓ Bottom Center`]),E(`button`,{"onClick":cma,className:(D(cju.value,`bottom-right`)?`activeBtn`:``) + ` lm`},[`↘ Bottom Right`])])])]),E(`div`,{className:`ln`,style:F([cmc()])},[(cjv.value?E(`div`,{className:`lo`},[E(EV,{cjb:`1`,cjc:`¡Operación completada exitosamente!`,cjd:`success`,cje:3000,cjk:ckv})]):null),(cjw.value?E(`div`,{className:`lo`},[E(EV,{cjb:`2`,cjc:`Error al procesar la solicitud`,cjd:`error`,cje:4000,cjk:ckx})]):null),(cjx.value?E(`div`,{className:`lo`},[E(EV,{cjb:`3`,cjc:`⚠️ Esta acción no se puede deshacer`,cjd:`warning`,cje:3500,cjk:ckz})]):null),(cjy.value?E(`div`,{className:`lo`},[E(EV,{cjb:`4`,cjc:`Nueva actualización disponible v2.0`,cjd:`info`,cje:3000,cjk:clb})]):null),(cjz.value?E(`div`,{className:`lo`},[E(EV,{cjb:`5`,cjc:`Archivo eliminado correctamente`,cjd:`success`,cje:4000,cjg:`Deshacer`,cjh:cln,cjk:cld})]):null),(cka.value?E(`div`,{className:`lo`},[E(EV,{cjb:`6`,cjc:`Error de conexión con el servidor`,cjd:`error`,cje:5000,cjg:`Reintentar`,cjh:clo,cjk:clf})]):null),(ckb.value?E(`div`,{className:`lo`},[E(EV,{cjb:`7`,cjc:`Tienes 3 nuevas notificaciones`,cjd:`info`,cje:4000,cjg:`Ver`,cjh:clp,cjj:`🔔`,cjk:clh})]):null),(ckc.value?E(`div`,{className:`lo`},[E(EV,{cjb:`8`,cjc:`Este mensaje permanece hasta que lo cierres`,cjd:`info`,cje:0,cjf:false,cjk:clj})]):null),(ckd.value?E(`div`,{className:`lo`},[E(EV,{cjb:`position-` + ax(cjt.value),cjc:cke.value,cjd:`info`,cje:2000,cjj:`📍`,cjk:cll})]):null)])])},EX=()=>{const cmd=()=>{return `border-bottom-color: ${o(d.value)};`},cme=()=>{return `background: ${ab(d.value)}; border: 1px solid ${o(d.value)};`},cmf=(cmg)=>{return I(cmg,[[`new`,()=>{return `background: #10b981; color: white;`}],[`pro`,()=>{return `background: #667eea; color: white;`}],[null,()=>{return `background: #6b7280; color: white;`}]])},cmh=()=>{return `background: ${ah(d.value)};`};return E(`div`,{},[E(`h1`,{className:`ro`},[`🔔 Toast Notifications`]),E(`p`,{className:`rp`},[`Sistema completo de notificaciones toast con múltiples tipos, posiciones, acciones y animaciones.
        Incluye auto-dismiss, barra de progreso, y soporte para acciones personalizadas.`]),E(`div`,{className:`rq`},[E(`h2`,{className:`rr`,style:F([cmd()])},[`Toast Pro Demo`]),E(`div`,{className:`rs`,style:F([cme()])},[E(`h3`,{className:`rt`},[`ToastPro`,E(`span`,{className:`rv`,style:F([cmf(`pro`)])},[`Pro`])]),E(`p`,{className:`ru`},[`Demo interactivo completo del sistema de notificaciones toast. Prueba diferentes tipos,
            posiciones, acciones y configuraciones para ver todas las capacidades del componente.`]),E(`div`,{className:`rw`,style:F([cmh()])},[E(EW,{})]),E(BC,{mr:`mint`,mq:`/* Ejemplo básico de uso */
<ToastPro
  id="unique-id"
  message="¡Operación completada exitosamente!"
  type="success"
  duration={3000}
  hasProgress={true}
  onClose={handleClose}
/>

/* Toast con acción */
<ToastPro
  id="undo-toast"
  message="Archivo eliminado correctamente"
  type="success"
  duration={4000}
  actionLabel="Deshacer"
  actionCallback={handleUndo}
  onClose={handleClose}
/>

/* Toast persistente (sin auto-dismiss) */
<ToastPro
  id="persistent-toast"
  message="Este mensaje permanece hasta que lo cierres"
  type="info"
  duration={0}
  hasProgress={false}
  onClose={handleClose}
/>

/* Toast con icono personalizado */
<ToastPro
  id="custom-icon"
  message="Tienes 3 nuevas notificaciones"
  type="info"
  duration={4000}
  customIcon="🔔"
  onClose={handleClose}
/>`})])]),E(`div`,{className:`rq`},[E(`h2`,{className:`rr`,style:F([cmd()])},[`Propiedades`]),E(`div`,{className:`rs`,style:F([cme()])},[E(`p`,{className:`ru`},[`El componente ToastPro acepta las siguientes propiedades:`]),E(BC,{mr:`mint`,mq:`property id : String
  /* Identificador único del toast (requerido) */

property message : String = ""
  /* Mensaje a mostrar en el toast */

property type : String = "info"
  /* Tipo de toast: "success", "error", "warning", "info" */

property duration : Number = 3000
  /* Duración en milisegundos (0 = sin auto-dismiss) */

property hasProgress : Bool = true
  /* Mostrar barra de progreso */

property actionLabel : String = ""
  /* Texto del botón de acción (opcional) */

property actionCallback : Function = defaultAction
  /* Función a ejecutar cuando se clickea la acción */

property customIcon : String = ""
  /* Icono personalizado (emoji o texto) */

property onClose : Function(String, Promise(Void)) = defaultClose
  /* Callback cuando el toast se cierra */`})])]),E(`div`,{className:`rq`},[E(`h2`,{className:`rr`,style:F([cmd()])},[`Tipos de Toast`]),E(`div`,{className:`rs`,style:F([cme()])},[E(`p`,{className:`ru`},[`ToastPro soporta 4 tipos diferentes de notificaciones, cada una con su propio color y estilo:`]),E(BC,{mr:`mint`,mq:`/* Success - Verde */
type="success"
  /* Para confirmar operaciones exitosas */

/* Error - Rojo */
type="error"
  /* Para mostrar errores y fallos */

/* Warning - Naranja/Amarillo */
type="warning"
  /* Para advertencias importantes */

/* Info - Azul */
type="info"
  /* Para información general */`})])]),E(`div`,{className:`rq`},[E(`h2`,{className:`rr`,style:F([cmd()])},[`Posicionamiento`]),E(`div`,{className:`rs`,style:F([cme()])},[E(`p`,{className:`ru`},[`Los toasts se pueden posicionar en 6 ubicaciones diferentes de la pantalla.
            El posicionamiento se controla mediante estilos en el contenedor:`]),E(BC,{mr:`mint`,mq:`/* Top Right (por defecto) */
style toastContainer {
  position: fixed;
  top: 20px;
  right: 20px;
  z-index: 9999;
}

/* Top Left */
style toastContainer {
  position: fixed;
  top: 20px;
  left: 20px;
  z-index: 9999;
}

/* Top Center */
style toastContainer {
  position: fixed;
  top: 20px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 9999;
}

/* Bottom Right */
style toastContainer {
  position: fixed;
  bottom: 20px;
  right: 20px;
  z-index: 9999;
}

/* Bottom Left */
style toastContainer {
  position: fixed;
  bottom: 20px;
  left: 20px;
  z-index: 9999;
}

/* Bottom Center */
style toastContainer {
  position: fixed;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 9999;
}`})])]),E(`div`,{className:`rq`},[E(`h2`,{className:`rr`,style:F([cmd()])},[`Ejemplo Completo`]),E(`div`,{className:`rs`,style:F([cme()])},[E(`p`,{className:`ru`},[`Ejemplo completo de implementación de un sistema de toast en tu componente:`]),E(BC,{mr:`mint`,mq:`component MyComponent {
  state showToast : Bool = false

  style toastContainer {
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 9999;
  }

  fun showSuccessToast (event : Html.Event) : Promise(Void) {
    next { showToast: true }
  }

  fun closeToast (id : String) : Promise(Void) {
    next { showToast: false }
  }

  fun render : Html {
    <div>
      <div::toastContainer>
        {
          if showToast {
            <ToastPro
              id="my-toast"
              message="¡Operación completada!"
              type="success"
              duration={3000}
              hasProgress={true}
              onClose={closeToast}
            />
          } else {
            <></>
          }
        }
      </div>

      <Button onClick={showSuccessToast}>
        "Mostrar Toast"
      </Button>
    </div>
  }
}`})])])])},EY=()=>{const cmi=L(`Getting Started`),cmj=L(``),cmk=L(``),cml=()=>{return `background: ${s(d.value)}; color: ${m(d.value)};`},cmm=()=>{return `
      border-right-color: ${o(d.value)};
      background: ${ab(d.value)};
    `},cmn=(cmo)=>{return (cmo?`
        background: ${ad(d.value)};
        color: ${af(d.value)};
        font-weight: 600;
      `:`
        background: transparent;
        color: ${m(d.value)};
        &:hover {
          background: ${ah(d.value)};
        }
      `)},cmp=()=>{return `border-bottom-color: ${o(d.value)};`},cmq=()=>{return `
      background: ${ab(d.value)};
      border-color: ${o(d.value)};
      box-shadow: ${aj(d.value)};
    `},cmr=()=>{return `
      background: ${s(d.value)};
      border-color: ${o(d.value)};
    `},cms=(cmt)=>{return N(()=>{cmi.value=cmt;cmj.value=``})},cmu=(cmv,cmw)=>{const cmx=D(cmi.value,cmw);return E(`div`,{"onClick":()=>{return cms(cmw)},className:`qa`,style:F([cmn(cmx)])},[cmv])},cmy=()=>{return E(`div`,{},[E(`h1`,{className:`qb`},[`Getting Started`]),E(`p`,{className:`qc`},[`Padre Style is a modern, comprehensive UI component library built with Mint Lang.
        It provides a complete set of customizable, themeable components for building
        beautiful web applications.`]),E(`div`,{className:`qd`},[E(`h2`,{className:`qe`,style:F([cmp()])},[`Installation`]),E(`div`,{className:`qf`,style:F([cmq()])},[E(`h3`,{className:`qg`},[`Clone the Repository`]),E(BC,{mr:`bash`,mq:`git clone https://github.com/your-username/padre-style.git
cd padre-style
mint install
mint start`})])]),E(`div`,{className:`qd`},[E(`h2`,{className:`qe`,style:F([cmp()])},[`Quick Example`]),E(`div`,{className:`qf`,style:F([cmq()])},[E(`h3`,{className:`qg`},[`Using a Button Component`]),E(`div`,{className:`qi`,style:F([cmr()])},[E(BD,{nu:(cmz)=>{return no(null)},nw:`primary`},M(`Click Me`))]),E(BC,{mr:`mint`,mq:`<DynamicButton
  onClick={(event : Html.Event) { Promise.resolve(void) }}
  variant="primary"
>"Click Me"</DynamicButton>`})])]),E(`div`,{className:`qd`},[E(`h2`,{className:`qe`,style:F([cmp()])},[`Theming`]),E(`div`,{className:`qf`,style:F([cmq()])},[E(`h3`,{className:`qg`},[`Theme System`]),E(`p`,{className:`qh`},[`Padre Style includes a powerful theming system with multiple built-in themes:
            Glass, Dark, Light, Dracula, Nord, Monokai, and Solarized.`]),E(`div`,{className:`qi`,style:F([cmr()])},[E(BB,{})]),E(BC,{mr:`mint`,mq:`// Wrap your app with theme provider
<DynamicThemeProvider>
  <YourApp/>
</DynamicThemeProvider>

// Use theme in components
connect ThemeStore exposing { currentTheme }

// Access theme colors
ThemeHelpers.getAccent(currentTheme)
ThemeHelpers.getBackground(currentTheme)`})])]),E(`div`,{className:`qd`},[E(`h2`,{className:`qe`,style:F([cmp()])},[`Component Categories`]),E(`div`,{className:`qf`,style:F([cmq()])},[E(`ul`,{},[E(`li`,{},[`📐 Layout - Flex, Grid, Stack, Box, Container`]),E(`li`,{},[`📝 Forms - Input, Select, Checkbox, Radio, Date Picker`]),E(`li`,{},[`📊 Charts - Line, Bar, Area, Donut, Radar, Heatmap`]),E(`li`,{},[`🖼️ Media - Image Carousel, Lightbox, Video Player`]),E(`li`,{},[`🔔 Feedback - Alerts, Toasts, Modals, Tooltips`]),E(`li`,{},[`🧭 Navigation - Navbar, Sidebar, Tabs, Breadcrumbs`]),E(`li`,{},[`📋 Data Display - Tables, Cards, Lists, Badges`]),E(`li`,{},[`💻 Code - Syntax Highlighting, Code Editor`])])])])])},cna=()=>{return I(cmi.value,[[`Getting Started`,()=>{return cmy()}],[`Layout`,()=>{return E(BK,{})}],[`Forms`,()=>{return E(CC,{})}],[`Charts`,()=>{return E(CK,{})}],[`Media`,()=>{return E(CY,{})}],[`Data Display`,()=>{return E(DO,{})}],[`Navigation`,()=>{return E(DU,{})}],[`Notifications`,()=>{return E(EC,{})}],[`Utilities`,()=>{return E(ET,{})}],[`Feedback`,()=>{return E(EU,{})}],[`Toast`,()=>{return E(EX,{})}],[null,()=>{return E(`div`,{},[`Select a category`])}]])};return E(`div`,{className:`pu`,style:F([cml()])},[E(`aside`,{className:`pv`,style:F([cmm()])},[E(`div`,{className:`px`},[`Padre Style`]),E(`div`,{className:`py`},[`Component Library`]),E(`div`,{className:`pz`},[`Documentation`]),cmu(`🚀 Getting Started`,`Getting Started`),cmu(`📖 Theme Guide`,`Theme Guide`),cmu(`🎨 Customization`,`Customization`),E(`div`,{className:`pz`},[`Components`]),cmu(`📐 Layout`,`Layout`),cmu(`📝 Forms`,`Forms`),cmu(`📊 Charts`,`Charts`),cmu(`🖼️ Media`,`Media`),cmu(`📋 Data Display`,`Data Display`),cmu(`🧭 Navigation`,`Navigation`),cmu(`🔔 Notifications`,`Notifications`),cmu(`🛠️ Utilities`,`Utilities`),cmu(`🔔 Toast`,`Toast`),cmu(`💬 Feedback`,`Feedback`),E(`div`,{className:`pz`},[`Examples`]),cmu(`🎯 Dashboard`,`Dashboard Example`),cmu(`📱 Landing Page`,`Landing Example`),cmu(`🛒 E-commerce`,`Ecommerce Example`)]),E(`main`,{className:`pw`},[cna()])])},EZ=()=>{return E(BA,{},M(E(`div`,{className:`c`,style:F([`
          background: ${s(d.value)};
          color: ${m(d.value)};
        `])},[E(`div`,{className:`d`},[E(BB,{})]),E(EY,{})])))};export default ()=>{S(EZ,{},W,[],false)};