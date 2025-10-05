import {patternVariable as O,bracketAccess as Q,createElement as G,useDidUpdate as I,newVariant as P,useEffect as H,useSignal as F,fragment as J,program as R,pattern as N,compare as E,variant as A,signal as C,record as B,match as M,style as K,batch as D,or as L} from "./runtime.js";export const S=A(1,`Maybe.Just`),T=A(0,`Maybe.Nothing`),U=A(1,`Result.Err`),V=A(1,`Result.Ok`),a=B(`CodeExample`),b=B(`SidebarItem`),c=B(`SidebarCategory`),d=B(`CaptionTrack`),e=B(`VideoQuality`),f=B(`PlatformInfo`),g=B(`PlaylistItem`),h=B(`AddressEditInfo`),i=B(`AddressEditSearchItem`),j=B(`TabItem`),k=B(`TabChangeEvent`),l=B(`TabClickEvent`),m=B(`TabScrollEvent`),n=B(`MatrixCell`),o=B(`MatrixData`),p=B(`AnimationItem`),W=A(1,`Http.ResponseBody.FormData`),X=A(1,`Http.ResponseBody.JSON`),Y=A(1,`Http.ResponseBody.HTML`),Z=A(1,`Http.ResponseBody.Text`),AA=A(1,`Http.ResponseBody.XML`),AB=A(1,`Http.ResponseBody.File`),AC=A(0,`Http.Error.NetworkError`),AD=A(0,`Http.Error.Aborted`),AE=A(0,`Http.Error.Timeout`),AF=A(0,`Http.Error.BadUrl`),AG=A(0,`Month.January`),AH=A(0,`Month.February`),AI=A(0,`Month.March`),AJ=A(0,`Month.April`),AK=A(0,`Month.May`),AL=A(0,`Month.June`),AM=A(0,`Month.July`),AN=A(0,`Month.August`),AO=A(0,`Month.September`),AP=A(0,`Month.October`),AQ=A(0,`Month.November`),AR=A(0,`Month.December`),AS=A(0,`Weekday.Monday`),AT=A(0,`Weekday.Tuesday`),AU=A(0,`Weekday.Wednesday`),AV=A(0,`Weekday.Thursday`),AW=A(0,`Weekday.Friday`),AX=A(0,`Weekday.Saturday`),AY=A(0,`Weekday.Sunday`),q=C(`default`),r=(s)=>{return (Promise.resolve(s))},t=(u)=>{((() => {
      const root = document.documentElement;

      switch(u) {
        case 'default':
          root.style.setProperty('--primary-color', '#1989fa');
          root.style.setProperty('--bg-color', '#eff2f5');
          root.style.setProperty('--text-color', '#333');
          root.style.setProperty('--card-bg', '#ffffff');
          root.style.setProperty('--navbar-bg', '#ffffff');
          root.style.setProperty('--navbar-text', '#1a1a1a');
          root.style.setProperty('--sidebar-bg', '#ffffff');
          root.style.setProperty('--sidebar-text', '#34495e');
          root.style.setProperty('--heading-color', '#1a1a1a');
          root.style.setProperty('--border-color', '#f7f8fa');
          root.style.setProperty('--shadow-color', 'rgba(0, 0, 0, 0.05)');
          break;
        case 'dark':
          root.style.setProperty('--primary-color', '#1989fa');
          root.style.setProperty('--bg-color', '#0f0f0f');
          root.style.setProperty('--text-color', '#e0e0e0');
          root.style.setProperty('--card-bg', '#1a1a1a');
          root.style.setProperty('--navbar-bg', '#1a1a1a');
          root.style.setProperty('--navbar-text', '#ffffff');
          root.style.setProperty('--sidebar-bg', '#1a1a1a');
          root.style.setProperty('--sidebar-text', '#b0b0b0');
          root.style.setProperty('--heading-color', '#ffffff');
          root.style.setProperty('--border-color', '#2a2a2a');
          root.style.setProperty('--shadow-color', 'rgba(0, 0, 0, 0.3)');
          break;
        case 'light':
          root.style.setProperty('--primary-color', '#1989fa');
          root.style.setProperty('--bg-color', '#fafafa');
          root.style.setProperty('--text-color', '#333333');
          root.style.setProperty('--card-bg', '#ffffff');
          root.style.setProperty('--navbar-bg', '#ffffff');
          root.style.setProperty('--navbar-text', '#1a1a1a');
          root.style.setProperty('--sidebar-bg', '#ffffff');
          root.style.setProperty('--sidebar-text', '#555555');
          root.style.setProperty('--heading-color', '#000000');
          root.style.setProperty('--border-color', '#e8e8e8');
          root.style.setProperty('--shadow-color', 'rgba(0, 0, 0, 0.08)');
          break;
        case 'blue':
          root.style.setProperty('--primary-color', '#2a5298');
          root.style.setProperty('--bg-color', '#e8eef5');
          root.style.setProperty('--text-color', '#1e3c72');
          root.style.setProperty('--card-bg', '#f5f8fc');
          root.style.setProperty('--navbar-bg', '#1e3c72');
          root.style.setProperty('--navbar-text', '#ffffff');
          root.style.setProperty('--sidebar-bg', '#f5f8fc');
          root.style.setProperty('--sidebar-text', '#2a5298');
          root.style.setProperty('--heading-color', '#1e3c72');
          root.style.setProperty('--border-color', '#d0dce8');
          root.style.setProperty('--shadow-color', 'rgba(30, 60, 114, 0.1)');
          break;
        case 'green':
          root.style.setProperty('--primary-color', '#71b280');
          root.style.setProperty('--bg-color', '#e8f4ec');
          root.style.setProperty('--text-color', '#134e5e');
          root.style.setProperty('--card-bg', '#f0f8f3');
          root.style.setProperty('--navbar-bg', '#134e5e');
          root.style.setProperty('--navbar-text', '#ffffff');
          root.style.setProperty('--sidebar-bg', '#f0f8f3');
          root.style.setProperty('--sidebar-text', '#2d6a4f');
          root.style.setProperty('--heading-color', '#134e5e');
          root.style.setProperty('--border-color', '#c7e6d1');
          root.style.setProperty('--shadow-color', 'rgba(19, 78, 94, 0.1)');
          break;
      }
    })());return r(null)},v=(w)=>{(()=>{q.value=w})();return t(w)},x=C(`#1989fa`),y=(z)=>{((() => {
      document.documentElement.style.setProperty('--primary-color', z);
    })());return r(null)},aa=(ab)=>{(()=>{x.value=ab})();return y(ab)},ac=()=>{t(q.value);return y(x.value)},ad=()=>{D(()=>{q.value=`default`;x.value=`#1989fa`});return ac()},ae=C(`desktop`),af=(ag)=>{return (()=>{ae.value=ag})()},ah=()=>{return (E(ae.value,`desktop`)?(()=>{ae.value=`mobile`})():(()=>{ae.value=`desktop`})())},ai=()=>{return E(ae.value,`mobile`)},aj=()=>{return E(ae.value,`desktop`)},ak=C(`home`),al=(am)=>{return (()=>{ak.value=am})()},an=C(`Essentials`),ao=(ap)=>{return (()=>{an.value=ap})()},aq=(ar,as)=>{return D(()=>{ak.value=ar;an.value=as})},at=C(false),au=()=>{return (()=>{at.value=!at.value})()},av=()=>{return (()=>{at.value=false})()},AZ=()=>{const aw=F(false),ax=()=>{return (()=>{aw.value=!aw.value})()},ay=()=>{return ah()},az=()=>{return au()};return G(`div`,{className:`id`},[G(`div`,{className:`ie`},[G(`div`,{className:`ig`},[G(`button`,{"onClick":az,className:`iv`},[G(`span`,{className:(at.value?`hamburgerLine1Open`:``) + ` iw`}),G(`span`,{className:(at.value?`hamburgerLine2Open`:``) + ` iw`}),G(`span`,{className:(at.value?`hamburgerLine3Open`:``) + ` iw`})]),G(`a`,{"href":`/`,className:`ih`},[G(`img`,{"src":`https://fastly.jsdelivr.net/npm/@vant/assets/logo.png`,className:`ii`}),G(`span`,{className:`ij`},[`Mint Wū`]),G(`span`,{className:`ik`},[`(Mint Lang 0.28.0)`])]),G(`ul`,{className:`il`},[G(`li`,{className:`im`},[G(`div`,{"onClick":ay,className:(E(ae.value,`mobile`)?`viewModeActive`:``) + ` is`},[(E(ae.value,`mobile`)?G(`svg`,{"viewBox":`0 0 24 24`,"fill":`currentColor`,className:`viewModeIcon` + ` it`},[G(`path`,{"d":`M17 1.01L7 1c-1.1 0-2 .9-2 2v18c0 1.1.9 2 2 2h10c1.1 0 2-.9 2-2V3c0-1.1-.9-1.99-2-1.99zM17 19H7V5h10v14z`})]):G(`svg`,{"viewBox":`0 0 24 24`,"fill":`currentColor`,className:`viewModeIcon` + ` it`},[G(`path`,{"d":`M21 2H3c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h7v2H8v2h8v-2h-2v-2h7c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 14H3V4h18v12z`})])),G(`span`,{className:`viewModeText` + ` iu`},[(E(ae.value,`mobile`)?`📱 Mobile`:`🖥️ Desktop`)])])]),G(`li`,{className:`im`},[G(`a`,{"target":`_blank`,"href":`https://github.com/mint-lang/mint`,className:`io`},[G(`img`,{"src":`https://fastly.jsdelivr.net/npm/@vant/assets/github.svg`,className:`ip`})])]),G(`li`,{className:`im`},[G(`a`,{"onClick":ax,className:`io`},[G(`img`,{"src":`https://b.yzcdn.cn/vant/dark-theme.svg`,className:`ip`})])]),G(`li`,{className:`im`},[G(`span`,{className:`iq ir`},[`v0.28.0`])]),G(`li`,{className:`im`},[G(`a`,{"href":`https://mint-lang.com`,"target":`_blank`,className:`iq`},[`Docs`])])])])])])},ba=()=>{return ([])},bb=()=>{return [c({id:`essentials`,title:`Essentials`,icon:`📚`,items:[b({id:`introduction`,label:`Introduction`,route:`/introduction`,subtitle:``,badge:``}),b({id:`quickstart`,label:`Quickstart`,route:`/quickstart`,subtitle:``,badge:``}),b({id:`themes`,label:`Themes`,route:`/themes`,subtitle:``,badge:`NEW`}),b({id:`advanced`,label:`Advanced Usage`,route:`/advanced`,subtitle:``,badge:``}),b({id:`faq`,label:`FAQ`,route:`/faq`,subtitle:``,badge:``}),b({id:`changelog`,label:`Changelog`,route:`/changelog`,subtitle:``,badge:``}),b({id:`contribution`,label:`Contribution Guide`,route:`/contribution`,subtitle:``,badge:``})]}),c({id:`basic`,title:`Basic Components`,icon:`🧩`,items:[b({id:`avatar`,label:`Avatar`,route:`/avatar`,subtitle:``,badge:``}),b({id:`button`,label:`Button`,route:`/button`,subtitle:``,badge:``}),b({id:`cell`,label:`Cell`,route:`/cell`,subtitle:``,badge:``}),b({id:`icon`,label:`Icon`,route:`/icon`,subtitle:``,badge:``}),b({id:`image`,label:`Image`,route:`/image`,subtitle:``,badge:``}),b({id:`layout`,label:`Layout`,route:`/layout`,subtitle:``,badge:``}),b({id:`popup`,label:`Popup`,route:`/popup`,subtitle:``,badge:``}),b({id:`space`,label:`Space`,route:`/space`,subtitle:``,badge:``}),b({id:`toast`,label:`Toast`,route:`/toast`,subtitle:``,badge:``})]}),c({id:`form`,title:`Form Components`,icon:`📝`,items:[b({id:`calendar`,label:`Calendar`,route:`/calendar`,subtitle:``,badge:``}),b({id:`cascader`,label:`Cascader`,route:`/cascader`,subtitle:``,badge:``}),b({id:`checkbox`,label:`Checkbox`,route:`/checkbox`,subtitle:``,badge:``}),b({id:`datepicker`,label:`DatePicker`,route:`/datepicker`,subtitle:``,badge:``}),b({id:`field`,label:`Field`,route:`/field`,subtitle:`Input`,badge:``}),b({id:`form`,label:`Form`,route:`/form`,subtitle:``,badge:``}),b({id:`number-keyboard`,label:`NumberKeyboard`,route:`/number-keyboard`,subtitle:``,badge:``}),b({id:`password-input`,label:`PasswordInput`,route:`/password-input`,subtitle:``,badge:``}),b({id:`picker`,label:`Picker`,route:`/picker`,subtitle:``,badge:``}),b({id:`radio`,label:`Radio`,route:`/radio`,subtitle:``,badge:``}),b({id:`rate`,label:`Rate`,route:`/rate`,subtitle:``,badge:``}),b({id:`search`,label:`Search`,route:`/search`,subtitle:``,badge:``}),b({id:`slider`,label:`Slider`,route:`/slider`,subtitle:``,badge:``}),b({id:`stepper`,label:`Stepper`,route:`/stepper`,subtitle:``,badge:``}),b({id:`switch`,label:`Switch`,route:`/switch`,subtitle:``,badge:``}),b({id:`timepicker`,label:`TimePicker`,route:`/timepicker`,subtitle:``,badge:``}),b({id:`uploader`,label:`Uploader`,route:`/uploader`,subtitle:``,badge:``})]}),c({id:`action`,title:`Action Components`,icon:`⚡`,items:[b({id:`action-sheet`,label:`ActionSheet`,route:`/action-sheet`,subtitle:``,badge:``}),b({id:`dialog`,label:`Dialog`,route:`/dialog`,subtitle:``,badge:``}),b({id:`dropdown-menu`,label:`DropdownMenu`,route:`/dropdown-menu`,subtitle:``,badge:``}),b({id:`loading`,label:`Loading`,route:`/loading`,subtitle:``,badge:``}),b({id:`notify`,label:`Notify`,route:`/notify`,subtitle:``,badge:``}),b({id:`overlay`,label:`Overlay`,route:`/overlay`,subtitle:``,badge:``}),b({id:`pull-refresh`,label:`PullRefresh`,route:`/pull-refresh`,subtitle:``,badge:``}),b({id:`share-sheet`,label:`ShareSheet`,route:`/share-sheet`,subtitle:``,badge:``}),b({id:`swipe-cell`,label:`SwipeCell`,route:`/swipe-cell`,subtitle:``,badge:``})]}),c({id:`display`,title:`Display Components`,icon:`🎨`,items:[b({id:`badge`,label:`Badge`,route:`/badge`,subtitle:``,badge:``}),b({id:`circle`,label:`Circle`,route:`/circle`,subtitle:`Progress`,badge:``}),b({id:`collapse`,label:`Collapse`,route:`/collapse`,subtitle:``,badge:``}),b({id:`countdown`,label:`CountDown`,route:`/countdown`,subtitle:``,badge:``}),b({id:`divider`,label:`Divider`,route:`/divider`,subtitle:``,badge:``}),b({id:`empty`,label:`Empty`,route:`/empty`,subtitle:``,badge:``}),b({id:`image-preview`,label:`ImagePreview`,route:`/image-preview`,subtitle:``,badge:``}),b({id:`lazyload`,label:`Lazyload`,route:`/lazyload`,subtitle:``,badge:``}),b({id:`list`,label:`List`,route:`/list`,subtitle:``,badge:``}),b({id:`notice-bar`,label:`NoticeBar`,route:`/notice-bar`,subtitle:``,badge:``}),b({id:`popover`,label:`Popover`,route:`/popover`,subtitle:``,badge:``}),b({id:`progress`,label:`Progress`,route:`/progress`,subtitle:``,badge:``}),b({id:`skeleton`,label:`Skeleton`,route:`/skeleton`,subtitle:``,badge:``}),b({id:`steps`,label:`Steps`,route:`/steps`,subtitle:``,badge:``}),b({id:`sticky`,label:`Sticky`,route:`/sticky`,subtitle:``,badge:``}),b({id:`swipe`,label:`Swipe`,route:`/swipe`,subtitle:``,badge:``}),b({id:`tag`,label:`Tag`,route:`/tag`,subtitle:``,badge:``}),b({id:`text-ellipsis`,label:`TextEllipsis`,route:`/text-ellipsis`,subtitle:``,badge:``}),b({id:`video-player`,label:`VideoPlayer`,route:`/video-player`,subtitle:``,badge:``}),b({id:`watermark`,label:`Watermark`,route:`/watermark`,subtitle:``,badge:`NEW`}),b({id:`matrix`,label:`Matrix`,route:`/matrix`,subtitle:`Grid Layout`,badge:`NEW`})]}),c({id:`navigation`,title:`Navigation Components`,icon:`🧭`,items:[b({id:`action-bar`,label:`ActionBar`,route:`/action-bar`,subtitle:``,badge:``}),b({id:`back-top`,label:`BackTop`,route:`/back-top`,subtitle:``,badge:``}),b({id:`grid`,label:`Grid`,route:`/grid`,subtitle:``,badge:``}),b({id:`index-bar`,label:`IndexBar`,route:`/index-bar`,subtitle:``,badge:``}),b({id:`navbar`,label:`NavBar`,route:`/navbar`,subtitle:``,badge:``}),b({id:`pagination`,label:`Pagination`,route:`/pagination`,subtitle:``,badge:``}),b({id:`sidebar`,label:`Sidebar`,route:`/sidebar`,subtitle:``,badge:``}),b({id:`tabs`,label:`Tabs`,route:`/tabs`,subtitle:``,badge:`NEW`}),b({id:`tabbar`,label:`Tabbar`,route:`/tabbar`,subtitle:``,badge:``}),b({id:`tree-select`,label:`TreeSelect`,route:`/tree-select`,subtitle:``,badge:``})]}),c({id:`business`,title:`Business Components`,icon:`💼`,items:[b({id:`address-edit`,label:`AddressEdit`,route:`/address-edit`,subtitle:``,badge:``}),b({id:`address-list`,label:`AddressList`,route:`/address-list`,subtitle:``,badge:``}),b({id:`area`,label:`Area`,route:`/area`,subtitle:``,badge:``}),b({id:`card`,label:`Card`,route:`/card`,subtitle:``,badge:``}),b({id:`contact-card`,label:`ContactCard`,route:`/contact-card`,subtitle:``,badge:``}),b({id:`coupon`,label:`Coupon`,route:`/coupon`,subtitle:`List`,badge:``}),b({id:`submit-bar`,label:`SubmitBar`,route:`/submit-bar`,subtitle:``,badge:``})]}),c({id:`tools`,title:`Tools`,icon:`🛠️`,items:[b({id:`codes`,label:`QR & Barcodes`,route:`/codes`,subtitle:``,badge:`NEW`})]}),c({id:`animations`,title:`Wū Animations`,icon:`✨`,items:[b({id:`enter-exit`,label:`Enter/Exit`,route:`/animations/enter-exit`,subtitle:`Fade, Slide, Scale`,badge:`NEW`}),b({id:`gestures`,label:`Gestures`,route:`/animations/gestures`,subtitle:`Hover, Tap, Drag`,badge:``}),b({id:`scroll`,label:`Scroll`,route:`/animations/scroll`,subtitle:`Reveal on scroll`,badge:``}),b({id:`keyframes`,label:`Keyframes`,route:`/animations/keyframes`,subtitle:`Sequences`,badge:``}),b({id:`transforms`,label:`Transforms`,route:`/animations/transforms`,subtitle:`Rotate, Scale`,badge:``}),b({id:`spring`,label:`Spring`,route:`/animations/spring`,subtitle:`Physics-based`,badge:``}),b({id:`orchestration`,label:`Orchestration`,route:`/animations/orchestration`,subtitle:`Stagger, Delays`,badge:``})]})]},bc=(bd,be)=>{return ((() => {
      for (let item of bd) {
        if (E(item, be)) {
          return true
        }
      }

      return false
    })())},bf=(bg,bh)=>{return ((() => {
      const newSet = []

      bg.forEach((item) => {
        if (E(item, bh)) { return }
        newSet.push(item)
      })

      return newSet
    })())},bi=(bj,bk)=>{return (bc(bj,bk)?bj:((() => {
        const newSet = Array.from(bj)
        newSet.push(bk)

        return newSet
      })()))},bl=(bm)=>{return E(bm,``)},bn=(bo)=>{return !bl(bo)},BA=({bp=true})=>{const bq=F([]),br=F(ba()),bs=()=>{return ((() => {
      setTimeout(() => {
        const currentPath = window.location.pathname;

        // Remover clase active de todos los links
        document.querySelectorAll('.sidebar a').forEach(link => {
          link.classList.remove('active');
        });

        // Agregar clase active al link actual
        const activeLink = document.querySelector('a[href="' + currentPath + '"]');
        if (activeLink) {
          activeLink.classList.add('active');

          const parentItem = activeLink.closest('[id^="sidebar-item-"]');
          if (parentItem) {
            parentItem.scrollIntoView({ behavior: 'smooth', block: 'center' });
          }
        }
      }, 100);
    })())},bt=(bu)=>{return (bc(br.value,bu)?(()=>{br.value=bf(br.value,bu)})():(()=>{br.value=bi(br.value,bu)})())},bv=(bw)=>{return bc(br.value,bw)},bx=()=>{return av()},by=(bz)=>{return E(ak.value,bz.id)},ca=(cb)=>{return G(`div`,{"id":`sidebar-item-` + cb.id,"data-route":cb.route,className:`hy`},[G(`a`,{"href":cb.route,"data-item-id":cb.id,"onClick":(cc)=>{return bx()},className:(by(cb)?`active`:``) + ` hz`},[G(`span`,{},[cb.label,(bn(cb.subtitle)?G(`span`,{className:`ia`},[cb.subtitle]):null)]),(bn(cb.badge)?G(`span`,{className:`ib`},[cb.badge]):null)])])},cd=(ce)=>{return G(`div`,{className:`hu`},[G(`div`,{"onClick":(cf)=>{return bt(ce.id)},className:`hv`},[G(`span`,{className:(bv(ce.id)?`collapsed`:``) + ` hw`},[`▼`]),ce.icon,` `,ce.title]),G(`div`,{className:(bv(ce.id)?`collapsed`:`expanded`) + ` hx`},[(()=>{const _0=[];const _1=ce.items;let _i=-1;for(let cg of _1){_i++;_0.push(ca(cg))};return _0})()])])};H(()=>{(()=>{bs();return (()=>{bq.value=bb()})()})()},[]);I(()=>{bs();return r(null)});return G(J,{},[G(`div`,{"onClick":bx,className:(at.value?`overlayVisible`:`overlayHidden`) + ` ic`}),G(`div`,{className:`sidebar ` + (bp?`fixed`:``) + ` ` + (at.value?`sidebarOpen`:`sidebarClosed`) + ` ht`},[(()=>{const _0=[];const _1=bq.value;let _i=-1;for(let ch of _1){_i++;_0.push(cd(ch))};return _0})()])])},ci=()=>{return r(null)},BB=()=>{const cj=F(0),ck=F(0),cl=F(0),cm=F(false),cn=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--o-a`]:`56px`,[`--o-b`]:`-2px`}):null);return _},co=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--p-a`]:`20px`,[`--p-b`]:`32px`}):null);return _},cp=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--q-a`]:`18px 48px`,[`--q-b`]:`16px`}):null);return _},cq=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--r-a`]:`100px 20px`}):null);return _},cr=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--s-a`]:`42px`}):null);return _},cs=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--t-a`]:`18px`,[`--t-b`]:`30px`}):null);return _},ct=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--u-a`]:`1fr`,[`--u-b`]:`40px`}):null);return _},cu=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--v-a`]:`100px 20px`}):null);return _},cv=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--w-a`]:`1fr`,[`--w-b`]:`60px`}):null);return _},cw=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--x-a`]:`40px`}):null);return _},cx=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--y-a`]:`80px 20px`}):null);return _},cy=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--z-a`]:`repeat(2, 1fr)`,[`--z-b`]:`40px`}):null);return _},cz=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--aa-a`]:`64px`}):null);return _},da=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--ab-a`]:`100px 20px`}):null);return _},db=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--ac-a`]:`48px`}):null);return _},dc=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--ad-a`]:`20px`,[`--ad-b`]:`60px`}):null);return _};H(()=>{(()=>{((() => {
      // Mouse tracking for interactive effects
      window.addEventListener('mousemove', (e) => {
        D(()=>{cj.value=(e.clientX);ck.value=(e.clientY)})
      });

      // Scroll tracking
      window.addEventListener('scroll', () => {
        (()=>{cl.value=(window.scrollY)})()
      });

      // Intersection Observer for scroll animations
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.classList.add('animate-in');
          }
        });
      }, { threshold: 0.1 });

      document.querySelectorAll('.animate-on-scroll').forEach(el => {
        observer.observe(el);
      });

      // Magnetic button effect
      document.querySelectorAll('.magnetic-btn').forEach(btn => {
        btn.addEventListener('mousemove', (e) => {
          const rect = btn.getBoundingClientRect();
          const x = e.clientX - rect.left - rect.width / 2;
          const y = e.clientY - rect.top - rect.height / 2;

          btn.style.transform = `translate(\${x * 0.3}px, \${y * 0.3}px)`;
        });

        btn.addEventListener('mouseleave', () => {
          btn.style.transform = 'translate(0, 0)';
        });
      });

      // Parallax layers
      window.addEventListener('scroll', () => {
        const scrolled = window.scrollY;
        document.querySelectorAll('.parallax-layer').forEach((layer, index) => {
          const speed = (index + 1) * 0.1;
          layer.style.transform = `translateY(\${scrolled * speed}px)`;
        });
      });

      // Cursor trail effect
      const canvas = document.getElementById('cursor-trail');
      const ctx = canvas.getContext('2d');
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;

      const particles = [];
      const particleCount = 50;

      window.addEventListener('mousemove', (e) => {
        particles.push({
          x: e.clientX,
          y: e.clientY,
          size: Math.random() * 5 + 2,
          speedX: (Math.random() - 0.5) * 2,
          speedY: (Math.random() - 0.5) * 2,
          life: 1
        });

        if (particles.length > particleCount) {
          particles.shift();
        }
      });

      function animateParticles() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        particles.forEach((particle, index) => {
          particle.x += particle.speedX;
          particle.y += particle.speedY;
          particle.life -= 0.02;
          particle.size *= 0.95;

          if (particle.life <= 0) {
            particles.splice(index, 1);
            return;
          }

          const gradient = ctx.createRadialGradient(
            particle.x, particle.y, 0,
            particle.x, particle.y, particle.size
          );
          gradient.addColorStop(0, `rgba(25, 137, 250, \${particle.life})`);
          gradient.addColorStop(1, `rgba(25, 137, 250, 0)`);

          ctx.fillStyle = gradient;
          ctx.beginPath();
          ctx.arc(particle.x, particle.y, particle.size, 0, Math.PI * 2);
          ctx.fill();
        });

        requestAnimationFrame(animateParticles);
      }

      animateParticles();

      window.addEventListener('resize', () => {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
      });
    })());return ci()})()},[]);return G(`div`,{className:`ga`},[G(`canvas`,{"id":`cursor-trail`,className:`gb`}),G(`section`,{className:`gc`},[G(`div`,{className:`gd`},[G(`div`,{className:`parallax-layer` + ` ge gf`}),G(`div`,{className:`parallax-layer` + ` ge gg`}),G(`div`,{className:`parallax-layer` + ` ge gh`}),G(`div`,{className:`gi`})]),G(`div`,{className:`gj`},[G(`div`,{className:`animate-on-scroll` + ` gk`},[`KINETIC UI`]),G(`h1`,{className:`animate-on-scroll` + ` gl`,style:K([cn()])},[`Mint Wū`]),G(`p`,{className:`animate-on-scroll` + ` gm`,style:K([co()])},[`Motion-first UI components that bring your interfaces to life. `,`Built for Mint Lang with fluid animations and interactive experiences.`]),G(`div`,{className:`gn`},[G(`button`,{className:`magnetic-btn` + ` go gp`,style:K([cp()])},[`Start Creating`]),G(`button`,{className:`magnetic-btn` + ` go gq`,style:K([cp()])},[`View Showcase`])])])]),G(`div`,{className:`gr`,style:K([cq()])},[G(`div`,{className:`animate-on-scroll` + ` gs`},[G(`h2`,{className:`gt`,style:K([cr()])},[`Built for Motion`]),G(`p`,{className:`gu`,style:K([cs()])},[`Every interaction designed to feel natural, responsive, and delightful`])]),G(`div`,{className:`gv`,style:K([ct()])},[G(`div`,{className:`animate-on-scroll` + ` gw`},[G(`span`,{className:`gx`},[`⚡`]),G(`h3`,{className:`gy`},[`Lightning Fast`]),G(`p`,{className:`gz`},[`60fps animations powered by GPU acceleration. Smooth performance even on low-end devices.`])]),G(`div`,{className:`animate-on-scroll` + ` gw`},[G(`span`,{className:`gx`},[`🎨`]),G(`h3`,{className:`gy`},[`Gesture Based`]),G(`p`,{className:`gz`},[`Natural touch interactions with spring physics and momentum scrolling built-in.`])]),G(`div`,{className:`animate-on-scroll` + ` gw`},[G(`span`,{className:`gx`},[`🎯`]),G(`h3`,{className:`gy`},[`Layout Aware`]),G(`p`,{className:`gz`},[`Automatic layout animations when elements resize, reorder, or change position.`])]),G(`div`,{className:`animate-on-scroll` + ` gw`},[G(`span`,{className:`gx`},[`🔮`]),G(`h3`,{className:`gy`},[`Scroll Magic`]),G(`p`,{className:`gz`},[`Parallax, reveal, and scroll-driven animations with precise control and easing.`])]),G(`div`,{className:`animate-on-scroll` + ` gw`},[G(`span`,{className:`gx`},[`✨`]),G(`h3`,{className:`gy`},[`Micro-interactions`]),G(`p`,{className:`gz`},[`Delightful details like magnetic buttons, ripple effects, and hover transformations.`])]),G(`div`,{className:`animate-on-scroll` + ` gw`},[G(`span`,{className:`gx`},[`🚀`]),G(`h3`,{className:`gy`},[`Page Transitions`]),G(`p`,{className:`gz`},[`Seamless route transitions with shared element animations and custom easing.`])])])]),G(`div`,{className:`ha`,style:K([cu()])},[G(`div`,{className:`hb`,style:K([cv()])},[G(`div`,{className:`animate-on-scroll` + ` hc`},[G(`h2`,{className:`hd`,style:K([cw()])},[`Interactive By Default`]),G(`p`,{className:`he`},[`Every component responds to your cursor, touch, and scroll. `,`Built with spring physics for natural motion that feels alive.`]),G(`button`,{className:`magnetic-btn` + ` go gp`,style:K([cp()])},[`Explore Components`])]),G(`div`,{className:`animate-on-scroll` + ` hf`},[G(`div`,{style:K([`font-size: 120px;`])},[`🎨`])])])]),G(`div`,{className:`hg`,style:K([cx()])},[G(`div`,{className:`hh`,style:K([cy()])},[G(`div`,{className:`animate-on-scroll` + ` hi`},[G(`div`,{className:`hj`,style:K([cz()])},[`50+`]),G(`div`,{className:`hk`},[`Components`])]),G(`div`,{className:`animate-on-scroll` + ` hi`},[G(`div`,{className:`hj`,style:K([cz()])},[`60fps`]),G(`div`,{className:`hk`},[`Performance`])]),G(`div`,{className:`animate-on-scroll` + ` hi`},[G(`div`,{className:`hj`,style:K([cz()])},[`100%`]),G(`div`,{className:`hk`},[`Animated`])]),G(`div`,{className:`animate-on-scroll` + ` hi`},[G(`div`,{className:`hj`,style:K([cz()])},[`∞`]),G(`div`,{className:`hk`},[`Possibilities`])])])]),G(`div`,{className:`hl`,style:K([da()])},[G(`h2`,{className:`animate-on-scroll` + ` hm`,style:K([db()])},[`Ready to Create Magic?`]),G(`p`,{className:`animate-on-scroll` + ` hn`,style:K([dc()])},[`Start building beautiful, animated interfaces today`]),G(`div`,{className:`gn`},[G(`button`,{className:`magnetic-btn` + ` go gp`,style:K([cp()])},[`Get Started Free`]),G(`button`,{className:`magnetic-btn` + ` go gq`,style:K([cp()])},[`Browse Documentation`])])])])},dd=C(`https://mint-lang.com`),de=(df,dg)=>{return ((() => {
      const text = df;
      const errorLevel = dg;

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
    })())},dh=C(`M`),di=C(``),dj=(dk)=>{return ((() => {
      const dataLength = dk.length;
      const capacities = [
        17, 32, 53, 78, 106, 134, 154, 192, 230, 271,
        321, 367, 425, 458, 520, 586, 644, 718, 792, 858,
        929, 1003, 1091, 1171, 1273, 1367, 1465, 1528, 1628, 1732,
        1840, 1952, 2068, 2188, 2303, 2431, 2563, 2699, 2809, 2953
      ];

      let version = 1;
      for (let i = 0; i < capacities.length; i++) {
        if (dataLength <= capacities[i]) {
          version = i + 1;
          break;
        }
      }

      return 21 + (version - 1) * 4;
    })())},dl=C(0),dm=(dn)=>{return D(()=>{dd.value=dn;di.value=de(dn,dh.value);dl.value=dj(dn)})},dp=(dq)=>{return D(()=>{dh.value=dq;di.value=de(dd.value,dq);dl.value=dj(dd.value)})},dr=C(`MINT-LANG-2025`),ds=[`212222`,`222122`,`222221`,`121223`,`121322`,`131222`,`122213`,`122312`,`132212`,`221213`,`221312`,`231212`,`112232`,`122132`,`122231`,`113222`,`123122`,`123221`,`223211`,`221132`,`221231`,`213212`,`223112`,`312131`,`311222`,`321122`,`321221`,`312212`,`322112`,`322211`,`212123`,`212321`,`232121`,`111323`,`131123`,`131321`,`112313`,`132113`,`132311`,`211313`,`231113`,`231311`,`112133`,`112331`,`132131`,`113123`,`113321`,`133121`,`313121`,`211331`,`231131`,`213113`,`213311`,`213131`,`311123`,`311321`,`331121`,`312113`,`312311`,`332111`,`314111`,`221411`,`431111`,`111224`,`111422`,`121124`,`121421`,`141122`,`141221`,`112214`,`112412`,`122114`,`122411`,`142112`,`142211`,`241211`,`221114`,`413111`,`241112`,`134111`,`111242`,`121142`,`121241`,`114212`,`124112`,`124211`,`411212`,`421112`,`421211`,`212141`,`214121`,`412121`,`111143`,`111341`,`131141`,`114113`,`114311`,`411113`,`411311`,`113141`,`114131`,`311141`,`411131`,`211412`,`211214`,`211232`,`2331112`],dt=104,du=106,dv=(dw)=>{return ((() => {
      const text = dw;
      const patterns = ds;
      const START_B = dt;
      const STOP = du;

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
    })())},dx=C(``),dy=(dz)=>{return (dv(dz).length)},ea=C(0),eb=(ec)=>{return D(()=>{dr.value=ec;dx.value=dv(ec);ea.value=dy(ec)})},ed=()=>{return D(()=>{di.value=de(dd.value,dh.value);dl.value=dj(dd.value)})},ee=()=>{return D(()=>{dx.value=dv(dr.value);ea.value=dy(dr.value)})},ef=()=>{return D(()=>{di.value=de(dd.value,dh.value);dl.value=dj(dd.value);dx.value=dv(dr.value);ea.value=dy(dr.value)})},eg=()=>{return [a({title:`Website URL`,content:`https://mint-lang.com`,description:`Escanea para visitar el sitio web oficial de Mint Lang`}),a({title:`Email Contact`,content:`mailto:contact@example.com?subject=Hello&body=Hi there!`,description:`Escanea para enviar un email preconfigurado`}),a({title:`WiFi Network`,content:`WIFI:T:WPA;S:MiRed;P:password123;H:false;;`,description:`Escanea para conectarte automáticamente a WiFi`}),a({title:`Phone Number`,content:`tel:+1234567890`,description:`Escanea para llamar directamente`}),a({title:`SMS Message`,content:`sms:+1234567890?body=Hello from Mint Lang!`,description:`Escanea para enviar SMS preconfigurado`}),a({title:`vCard Contact`,content:`BEGIN:VCARD\\nVERSION:3.0\\nFN:John Doe\\nTEL:+1234567890\\nEMAIL:john@example.com\\nEND:VCARD`,description:`Escanea para agregar contacto a tu teléfono`}),a({title:`Geolocation`,content:`geo:37.7749,-122.4194`,description:`Escanea para abrir ubicación en mapas (San Francisco)`}),a({title:`Event Calendar`,content:`BEGIN:VEVENT\\nSUMMARY:Mint Lang Workshop\\nDTSTART:20250201T100000\\nDTEND:20250201T120000\\nEND:VEVENT`,description:`Escanea para agregar evento al calendario`}),a({title:`Payment (Bitcoin)`,content:`bitcoin:1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa?amount=0.001`,description:`Escanea para realizar pago con Bitcoin`}),a({title:`WhatsApp Message`,content:`https://wa.me/1234567890?text=Hello from Mint Lang!`,description:`Escanea para enviar mensaje de WhatsApp`}),a({title:`YouTube Video`,content:`https://www.youtube.com/watch?v=dQw4w9WgXcQ`,description:`Escanea para ver video en YouTube`}),a({title:`JSON Data`,content:`{\\"name\\":\\"Mint Lang\\",\\"type\\":\\"Programming Language\\",\\"year\\":2025}`,description:`Escanea para obtener datos JSON estructurados`})]},eh=()=>{return [a({title:`Product SKU`,content:`PROD-2025-001`,description:`Código de producto para inventario`}),a({title:`Order Number`,content:`ORD-20250104-ABC123`,description:`Número de orden para seguimiento`}),a({title:`Serial Number`,content:`SN-MINT-78945612`,description:`Número de serie de dispositivo`}),a({title:`License Plate`,content:`ABC-1234`,description:`Placa de vehículo`}),a({title:`Batch Code`,content:`BATCH-A-2025-01`,description:`Código de lote de producción`}),a({title:`Tracking Code`,content:`TRACK-XYZ-456789`,description:`Código de rastreo de paquete`}),a({title:`ISBN Book`,content:`ISBN-978-3-16-148410-0`,description:`Código ISBN de libro`}),a({title:`Membership ID`,content:`MEMBER-GOLD-9876`,description:`ID de membresía premium`}),a({title:`Ticket Number`,content:`TICKET-2025-A1B2C3`,description:`Número de ticket de evento`}),a({title:`Asset Tag`,content:`ASSET-IT-LAPTOP-042`,description:`Etiqueta de activo empresarial`}),a({title:`Coupon Code`,content:`DISCOUNT-50OFF-2025`,description:`Código de cupón de descuento`}),a({title:`Container ID`,content:`CONT-PORT-A-5678`,description:`ID de contenedor de carga`})]},BC=({ei=8,ej=4})=>{H(()=>{(()=>{return ((() => {
      setTimeout(() => {
        const canvas = document.querySelector('[data-qr-canvas]');
        if (!canvas) return;

        const ctx = canvas.getContext('2d');
        const matrix = JSON.parse(di.value || '[]');
        const size = dl.value;
        const moduleSize = ei;
        const quietZone = ej;

        if (!matrix.length || !size) return;

        const canvasSize = (size + quietZone * 2) * moduleSize;
        canvas.width = canvasSize;
        canvas.height = canvasSize;

        ctx.fillStyle = '#FFFFFF';
        ctx.fillRect(0, 0, canvasSize, canvasSize);

        ctx.fillStyle = '#000000';
        for (let row = 0; row < size; row++) {
          for (let col = 0; col < size; col++) {
            if (matrix[row] && matrix[row][col] === 1) {
              ctx.fillRect(
                (col + quietZone) * moduleSize,
                (row + quietZone) * moduleSize,
                moduleSize,
                moduleSize
              );
            }
          }
        }
      }, 10);

      return Promise.resolve();
    })())})()},[]);I(()=>{return ek()});return G(`canvas`,{"data-qr-canvas":`true`,className:`a`})},BD=({el=100,em=2})=>{H(()=>{(()=>{return ((() => {
      setTimeout(() => {
        const canvas = document.querySelector('[data-barcode-canvas]');
        if (!canvas) return;

        const ctx = canvas.getContext('2d');
        const pattern = dx.value;
        const barHeight = el;
        const barWidth = em;

        if (!pattern) return;

        const totalWidth = pattern.length * barWidth;
        canvas.width = totalWidth + 20;
        canvas.height = barHeight + 20;

        ctx.fillStyle = '#FFFFFF';
        ctx.fillRect(0, 0, canvas.width, canvas.height);

        ctx.fillStyle = '#000000';
        for (let i = 0; i < pattern.length; i++) {
          if (pattern[i] === '1') {
            ctx.fillRect(10 + i * barWidth, 10, barWidth, barHeight);
          }
        }
      }, 10);

      return Promise.resolve();
    })())})()},[]);I(()=>{return en()});return G(`div`,{},[G(`canvas`,{"data-barcode-canvas":`true`,className:`b`}),G(`div`,{className:`c`},[dr.value])])},BE=()=>{const eo=F([]),ep=F([]),eq=(er)=>{return dm(er)},es=(et)=>{return eb(et)},eu=(ev)=>{return G(`div`,{"onClick":(ew)=>{return eq(ev.content)},className:`ai`},[G(`div`,{className:`aj`},[ev.title]),G(`div`,{className:`ak`},[ev.description]),G(`code`,{className:`al`},[ev.content])])},ex=(ey)=>{return G(`div`,{"onClick":(ez)=>{return es(ey.content)},className:`ai`},[G(`div`,{className:`aj`},[ey.title]),G(`div`,{className:`ak`},[ey.description]),G(`code`,{className:`al`},[ey.content])])};H(()=>{(()=>{D(()=>{eo.value=eg();ep.value=eh()});return ef()})()},[]);return G(`div`,{className:`w`},[G(`div`,{className:`x`},[G(`h1`,{className:`y`},[`QR Codes & Barcodes`]),G(`p`,{className:`z`},[`Generate scannable QR codes and CODE128 barcodes in real-time`])]),G(`div`,{className:`aa`},[G(`div`,{className:`ab`},[G(`span`,{className:`ae`},[`📱`]),`QR Code Generator`,G(`span`,{className:`af`},[`Live`])]),G(`div`,{className:`ac`},[G(`div`,{},[G(`p`,{className:`ag`},[`📋 Current Content: `,dd.value]),G(`div`,{className:`am`},[`📚 Click an example to load:`]),G(`div`,{className:`ah`},[(()=>{const _0=[];const _1=eo.value;let _i=-1;for(let fa of _1){_i++;_0.push(eu(fa))};return _0})()])]),G(`div`,{className:`ad`},[G(BC,{ei:6,ej:4})])])]),G(`div`,{className:`aa`},[G(`div`,{className:`ab`},[G(`span`,{className:`ae`},[`📊`]),`CODE128 Barcode Generator`,G(`span`,{className:`af`},[`Live`])]),G(`div`,{className:`ac`},[G(`div`,{},[G(`p`,{className:`ag`},[`📋 Current Text: `,dr.value]),G(`div`,{className:`am`},[`📚 Click an example to load:`]),G(`div`,{className:`ah`},[(()=>{const _0=[];const _1=ep.value;let _i=-1;for(let fb of _1){_i++;_0.push(ex(fb))};return _0})()])]),G(`div`,{className:`ad`},[G(BD,{el:120,em:3})])])])])},BF=()=>{const fc=(fd)=>{return v(fd)},fe=(ff)=>{return aa(ff)},fg=()=>{return ad()},fh=()=>{return ac()},fi=(fj,fk,fl)=>{return G(`div`,{"onClick":(fm)=>{return fc(fj)},className:(E(q.value,fj)?`selected`:``) + ` k`},[G(`div`,{className:`l`,style:K([`background: ` + fl + `;`])}),G(`span`,{className:`m`},[fk])])},fn=(fo)=>{return G(`div`,{"onClick":(fp)=>{return fe(fo)},className:(E(x.value,fo)?`selected`:``) + ` p`,style:K([`background: ` + fo + `;`])})};return G(`div`,{className:`d`},[G(`div`,{className:`e`},[G(`div`,{className:`f`},[G(`h2`,{className:`g`},[`Customize Theme`]),G(`div`,{className:`q`},[G(`button`,{"onClick":(fq)=>{return fg()},className:`r`},[`Reset`]),G(`button`,{"onClick":(fr)=>{return fh()},className:`primary` + ` r`},[`Apply Theme`])])]),G(`div`,{className:`h`},[G(`label`,{className:`i`},[`Theme Preset`]),G(`div`,{className:`j`},[fi(`default`,`Default`,`linear-gradient(135deg, #667eea 0%, #764ba2 100%)`),fi(`dark`,`Dark`,`#1a1a1a`),fi(`light`,`Light`,`#ffffff`),fi(`blue`,`Blue Ocean`,`linear-gradient(135deg, #1e3c72 0%, #2a5298 100%)`),fi(`green`,`Nature`,`linear-gradient(135deg, #134e5e 0%, #71b280 100%)`)])]),G(`div`,{className:`h`},[G(`label`,{className:`i`},[`Accent Color`]),G(`div`,{className:`n`},[G(`input`,{"type":`text`,"value":x.value,className:`o`}),fn(`#1989fa`),fn(`#5a54f9`),fn(`#9e339f`),fn(`#ed4192`),fn(`#e0282e`),fn(`#f4801a`),fn(`#f2bd27`),fn(`#00b96b`)])])])])},BG=()=>{return G(`div`,{className:`s`},[G(`div`,{className:`t`},[G(`h1`,{className:`u`},[`Theme Customizer`]),G(`p`,{className:`v`},[`Customize your application theme with colors, radius, and presets. `,`Changes apply in real-time to preview your theme.`])]),G(BF,{})])},fs=()=>{return new T()},ft=(fu)=>{return (fu.length)},fv=(fw,fx)=>{return L(T,U,fw,fx)},fy=(fz,ga)=>{return M(fz,[[N(S,[O]),(gb)=>{return P(S)(ga(gb))}],[N(T,[]),()=>{return new T()}]])},gc=(gd,ge)=>{return Q(gd,ge,S,T)},gf=(gg)=>{return (gg.toString())},gh=(gi)=>{return (Math.floor(gi))},BH=({gj=[],gk=[],gl=[],gm=fs(),gn=``,go=`100%`,gp=`auto`,gq=false,gr=false,gs=false,gt=true,gu=true,gv=true})=>{const gw=F(false),gx=F(0),gy=F(0),gz=F(0),ha=F(1),hb=F(1),hc=F(false),hd=F(0),he=F(-1),hf=F(0),hg=F(true),hh=F(false),hi=F(false),hj=F(false),hk=F(false),hl=F(false),hm=F(false),hn=F(false),ho=F(false),hp=F(false),hq=F(false),hr=F(0),hs=F(false),ht=F(0),hu=F(0),hv=F(0),hw=F(0),hx=F(0),hy=F(0),hz=(ia)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        if (video.paused) {
          video.play();
        } else {
          video.pause();
        }
      }
    })());return (gu?(gw.value?D(()=>{gw.value=false;hw.value=hw.value + 1}):D(()=>{gw.value=true;hv.value=hv.value + 1})):(()=>{gw.value=!gw.value})())},ib=(ic)=>{return id(ic)},ie=(ig)=>{((() => {
      const progressBar = event.currentTarget;
      const rect = progressBar.getBoundingClientRect();
      const x = event.clientX - rect.left;
      const percentage = x / rect.width;

      const video = document.querySelector('[data-pro-video]');
      if (video && video.duration) {
        video.currentTime = percentage * video.duration;
      }
    })());return (()=>{hx.value=hx.value + 1})()},ih=(ii)=>{((() => {
      const progressBar = event.currentTarget;
      const rect = progressBar.getBoundingClientRect();
      const x = event.clientX - rect.left;
      const percentage = Math.max(0, Math.min(1, x / rect.width));

      const video = document.querySelector('[data-pro-video]');
      if (video && video.duration) {
        const time = percentage * video.duration;
        ij((true),(time),(x))
      }
    })());return r(null)},ik=(il)=>{return (()=>{hs.value=false})()},im=(io)=>{return (()=>{hh.value=!hh.value})()},ip=(iq)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        video.muted = !video.muted;
      }
    })());return D(()=>{hc.value=!hc.value;ha.value=(hc.value?1:0)})},ir=(is)=>{return D(()=>{hi.value=!hi.value;hj.value=false;hk.value=false;hm.value=false})},it=(iu)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        video.playbackRate = iu;
      }
    })());return D(()=>{hb.value=iu;hi.value=false})},iv=(iw)=>{return D(()=>{hj.value=!hj.value;hi.value=false;hk.value=false;hm.value=false})},ix=(iy)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        const currentTime = video.currentTime;
        const wasPlaying = !video.paused;

        // Store time and state, then change source
        video.addEventListener('loadedmetadata', () => {
          video.currentTime = currentTime;
          if (wasPlaying) {
            video.play();
          }
        }, { once: true });
      }
    })());return D(()=>{hd.value=iy;hj.value=false;hy.value=hy.value + 1})},iz=(ja)=>{return D(()=>{hk.value=!hk.value;hi.value=false;hj.value=false;hm.value=false})},jb=(jc)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        const tracks = video.textTracks;
        for (let i = 0; i < tracks.length; i++) {
          tracks[i].mode = i === jc ? 'showing' : 'hidden';
        }
      }
    })());return D(()=>{he.value=jc;hk.value=false})},id=(jd)=>{((() => {
      const container = document.querySelector('[data-pro-container]');
      if (container) {
        if (!document.fullscreenElement) {
          container.requestFullscreen().catch(err => {
            console.error('Fullscreen error:', err);
          });
        } else {
          document.exitFullscreen();
        }
      }
    })());return (()=>{hn.value=!hn.value})()},je=(jf)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video && document.pictureInPictureEnabled) {
        if (!document.pictureInPictureElement) {
          video.requestPictureInPicture().catch(err => {
            console.error('PiP error:', err);
          });
        } else {
          document.exitPictureInPicture();
        }
      }
    })());return r(null)},jg=(jh)=>{return (()=>{ho.value=!ho.value})()},ji=(jj)=>{return (()=>{ho.value=false})()},jk=(jl)=>{return (()=>{hl.value=!hl.value})()},jm=(jn)=>{return D(()=>{hf.value=jn;hl.value=false})},jo=(jp)=>{const jq=(hf.value < ft(gj) - 1?hf.value + 1:0);return (()=>{hf.value=jq})()},jr=(js)=>{const jt=(hf.value > 0?hf.value - 1:ft(gj) - 1);return (()=>{hf.value=jt})()},ju=(jv)=>{return (()=>{hg.value=true})()},jw=(jx)=>{return (gw.value?D(()=>{hg.value=false;hh.value=false}):r(null))},jy=(jz)=>{return (()=>{hg.value=true})()},ka=(kb,kc,kd,ke)=>{return D(()=>{gx.value=kb;gy.value=kc;gz.value=kd;hp.value=ke})},kf=(kg)=>{return (()=>{gw.value=kg})()},kh=(ki)=>{return (()=>{ha.value=ki})()},kj=(kk)=>{return (()=>{hp.value=kk})()},kl=(km)=>{return (()=>{hn.value=km})()},ij=(kn,ko,kp)=>{return D(()=>{hs.value=kn;hr.value=ko;ht.value=kp})},kq=()=>{return ((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        const currentTime = video.currentTime || 0;
        const duration = video.duration || 0;
        const isLoading = video.readyState < 3;

        // Calculate buffered
        let bufferedEnd = 0;
        if (video.buffered.length > 0) {
          bufferedEnd = video.buffered.end(video.buffered.length - 1);
        }

        ka((currentTime),(duration),(bufferedEnd),(isLoading))
      }
    })())},kr=()=>{return (ft(gj) > 0?ks():(gs?(()=>{((() => {
        const video = document.querySelector('[data-pro-video]');
        if (video) {
          video.currentTime = 0;
          video.play();
        }
      })());return r(null)})():(()=>{gw.value=false})()))},ks=()=>{const kt=(hf.value < ft(gj) - 1?hf.value + 1:0);return (()=>{hf.value=kt})()},ku=(kv)=>{const kw=gh(kv / 3600);const kx=gh((kv % 3600) / 60);const ky=gh(kv % 60);const kz=(kx < 10?`0` + gf(kx):gf(kx));const la=(ky < 10?`0` + gf(ky):gf(ky));return (kw > 0?gf(kw) + `:` + kz + `:` + la:gf(kx) + `:` + la)},lb=()=>{return (gy.value > 0?(gx.value / gy.value) * 100:0)},lc=()=>{return (gy.value > 0?(gz.value / gy.value) * 100:0)},ld=()=>{return (ft(gk) > 0?fv(fy(gc(gk,hd.value),(le)=>{return le.src}),``):(ft(gj) > 0?fv(fy(gc(gj,hf.value),(lf)=>{return lf.src}),``):``))},lg=()=>{return (ft(gj) > 0?fv(fy(gc(gj,hf.value),(lh)=>{return lh.poster}),gn):gn)},li=()=>{return (hc.value || E(ha.value,0)?`🔇`:(ha.value > 0.5?`🔊`:`🔉`))},lj=()=>{const _={[`--b-a`]:go,[`--b-b`]:gp};return _};H(()=>{(()=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      const container = document.querySelector('[data-pro-container]');

      if (video) {
        // Time update
        video.addEventListener('timeupdate', () => {
          kq()
        });

        // Metadata loaded
        video.addEventListener('loadedmetadata', () => {
          kq()
        });

        // Waiting/buffering
        video.addEventListener('waiting', () => {
          kj((true))
        });

        // Can play
        video.addEventListener('canplay', () => {
          kj((false))
        });

        // Ended
        video.addEventListener('ended', () => {
          kr()
        });

        // Volume change
        video.addEventListener('volumechange', () => {
          kh((video.volume))
        });

        // Play/Pause
        video.addEventListener('play', () => {
          kf((true))
        });

        video.addEventListener('pause', () => {
          kf((false))
        });
      }

      // Keyboard events
      if (gt) {
        document.addEventListener('keydown', (event) => {
          if (document.activeElement === document.body ||
              document.activeElement.tagName === 'VIDEO') {
            const key = event.key;
            const video = document.querySelector('[data-pro-video]');
            if (!video) return;

            event.preventDefault();

            switch(key) {
              case ' ':
              case 'k':
                // Play/Pause
                if (video.paused) {
                  video.play();
                } else {
                  video.pause();
                }
                break;

              case 'ArrowLeft':
                // Seek backward 5s
                video.currentTime = Math.max(0, video.currentTime - 5);
                break;

              case 'ArrowRight':
                // Seek forward 5s
                video.currentTime = Math.min(video.duration, video.currentTime + 5);
                break;

              case 'ArrowUp':
                // Volume up 10%
                video.volume = Math.min(1, video.volume + 0.1);
                break;

              case 'ArrowDown':
                // Volume down 10%
                video.volume = Math.max(0, video.volume - 0.1);
                break;

              case 'f':
                // Fullscreen
                const container = document.querySelector('[data-pro-container]');
                if (!document.fullscreenElement) {
                  container.requestFullscreen();
                } else {
                  document.exitFullscreen();
                }
                break;

              case 'm':
                // Mute
                video.muted = !video.muted;
                break;

              case 'j':
                // Seek backward 10s
                video.currentTime = Math.max(0, video.currentTime - 10);
                break;

              case 'l':
                // Seek forward 10s
                video.currentTime = Math.min(video.duration, video.currentTime + 10);
                break;

              case 'Home':
                // Jump to start
                video.currentTime = 0;
                break;

              case 'End':
                // Jump to end
                video.currentTime = video.duration;
                break;

              case '0':
              case '1':
              case '2':
              case '3':
              case '4':
              case '5':
              case '6':
              case '7':
              case '8':
              case '9':
                // Jump to percentage
                const percent = parseInt(key) * 10;
                video.currentTime = (percent / 100) * video.duration;
                break;

              case '<':
              case ',':
                // Decrease playback speed
                video.playbackRate = Math.max(0.25, video.playbackRate - 0.25);
                break;

              case '>':
              case '.':
                // Increase playback speed
                video.playbackRate = Math.min(2, video.playbackRate + 0.25);
                break;
            }
          }
        });
      }

      // Fullscreen change
      document.addEventListener('fullscreenchange', () => {
        const isFs = !!document.fullscreenElement;
        kl((isFs))
      });
    })());return r(null)})()},[]);return G(`div`,{"data-pro-container":`true`,"onMouseEnter":ju,"onMouseLeave":jw,"onMouseMove":jy,"onDoubleClick":ib,className:(hn.value?`fullscreen`:(ho.value?`mini`:``)) + ` as`,style:K([lj()])},[(ho.value?G(`div`,{className:`cc`},[G(`button`,{"onClick":jg,"title":`Restore`,className:`cd`},[`⛶`]),G(`button`,{"onClick":ji,"title":`Close`,className:`cd`},[`✕`])]):null),G(`video`,{"data-pro-video":`true`,"src":ld(),"poster":lg(),className:`at`},[(()=>{const _0=[];const _1=gl;let _i=-1;for(let lk of _1){_i++;_0.push((lk.isDefault?G(`track`,{"label":lk.label,"kind":`subtitles`,"srcLang":lk.language,"src":lk.src,"default":`true`}):G(`track`,{"label":lk.label,"kind":`subtitles`,"srcLang":lk.language,"src":lk.src})))};return _0})()]),(hp.value?G(`div`,{className:`au`},[G(`div`,{className:`av`})]):null),(!gw.value && !ho.value?G(`div`,{className:`aw ax`},[G(`button`,{"onClick":hz,className:`ay`},[`▶`])]):null),G(`div`,{className:`az`,style:K([(hg.value || !gw.value?`opacity: 1`:`opacity: 0`)])},[G(`div`,{className:`ba`},[G(`div`,{"onClick":ie,"onMouseMove":ih,"onMouseLeave":ik,className:`bb`},[G(`div`,{className:(hs.value?`progressBarHover`:``) + ` bc`},[G(`div`,{className:`bd`,style:K([`width: ` + gf(lc()) + `%`])}),G(`div`,{className:`be`,style:K([`width: ` + gf(lb()) + `%`])},[G(`div`,{className:(hs.value?`thumbVisible`:``) + ` bf`})])]),(hs.value?G(`div`,{className:`bg bh`,style:K([`left: ` + gf(ht.value) + `px`])},[G(`div`,{className:`bi`}),G(`div`,{className:`bj`},[ku(hr.value)])]):null)])]),G(`div`,{className:`bk`},[G(`button`,{"onClick":hz,"title":`Play/Pause (Space)`,className:`bl`},[(gw.value?`⏸`:`▶`)]),(ft(gj) > 1?G(`button`,{"onClick":jr,"title":`Previous`,className:`bl`},[`⏮`]):null),(ft(gj) > 1?G(`button`,{"onClick":jo,"title":`Next`,className:`bl`},[`⏭`]):null),G(`div`,{"onMouseEnter":im,"onMouseLeave":im,className:`bm`},[G(`button`,{"onClick":ip,"title":`Mute (M)`,className:`bl`},[li()]),G(`div`,{className:(hh.value?`visible`:``) + ` bn`},[G(`div`,{className:`bo`},[G(`div`,{className:`bp`,style:K([`width: ` + gf(ha.value * 100) + `%`])})])])]),G(`div`,{className:`bq`},[ku(gx.value),` / `,ku(gy.value)]),G(`div`,{className:`br`}),(ft(gl) > 0 && !ho.value?G(`div`,{style:K([`position: relative;`])},[G(`button`,{"onClick":iz,"title":`Captions`,className:`bl`},[`CC`]),(hk.value?G(`div`,{className:`bs`},[G(`div`,{"onClick":(ll)=>{return jb(-1)},className:(E(he.value,-1)?`active`:``) + ` bt`},[`Off`]),(()=>{const _0=[];const _1=gl;let _i=-1;for(let lm of _1){_i++;const ln=_i;_0.push(G(`div`,{"onClick":(lo)=>{return jb(ln)},className:(E(he.value,ln)?`active`:``) + ` bt`},[lm.label,(E(he.value,ln)?G(`span`,{className:`bu`},[`✓`]):null)]))};return _0})()]):null)]):null),(ft(gk) > 1 && !ho.value?G(`div`,{style:K([`position: relative;`])},[G(`button`,{"onClick":iv,"title":`Quality`,className:`bl`},[`⚙`]),(hj.value?G(`div`,{className:`bs`},[(()=>{const _0=[];const _1=gk;let _i=-1;for(let lp of _1){_i++;const lq=_i;_0.push(G(`div`,{"onClick":(lr)=>{return ix(lq)},className:(E(hd.value,lq)?`active`:``) + ` bt`},[lp.label,(E(hd.value,lq)?G(`span`,{className:`bu`},[`✓`]):null)]))};return _0})()]):null)]):null),(!ho.value?G(`div`,{style:K([`position: relative;`])},[G(`button`,{"onClick":ir,"title":`Speed`,className:`bl`},[(E(hb.value,1)?`1x`:gf(hb.value) + `x`)]),(hi.value?G(`div`,{className:`bs`},[G(`div`,{"onClick":(ls)=>{return it(0.25)},className:(E(hb.value,0.25)?`active`:``) + ` bt`},[`0.25x`]),G(`div`,{"onClick":(lt)=>{return it(0.5)},className:(E(hb.value,0.5)?`active`:``) + ` bt`},[`0.5x`]),G(`div`,{"onClick":(lu)=>{return it(0.75)},className:(E(hb.value,0.75)?`active`:``) + ` bt`},[`0.75x`]),G(`div`,{"onClick":(lv)=>{return it(1)},className:(E(hb.value,1)?`active`:``) + ` bt`},[`Normal`]),G(`div`,{"onClick":(lw)=>{return it(1.25)},className:(E(hb.value,1.25)?`active`:``) + ` bt`},[`1.25x`]),G(`div`,{"onClick":(lx)=>{return it(1.5)},className:(E(hb.value,1.5)?`active`:``) + ` bt`},[`1.5x`]),G(`div`,{"onClick":(ly)=>{return it(1.75)},className:(E(hb.value,1.75)?`active`:``) + ` bt`},[`1.75x`]),G(`div`,{"onClick":(lz)=>{return it(2)},className:(E(hb.value,2)?`active`:``) + ` bt`},[`2x`])]):null)]):null),(ft(gj) > 0 && !ho.value?G(`button`,{"onClick":jk,"title":`Playlist`,className:`bl`},[`☰`]):null),(gv && !hn.value && !ho.value?G(`button`,{"onClick":jg,"title":`Mini Player`,className:`bl`},[`⧉`]):null),(!ho.value?G(`button`,{"onClick":je,"title":`Picture-in-Picture`,className:`bl`},[`⧉`]):null),(!ho.value?G(`button`,{"onClick":id,"title":`Fullscreen (F)`,className:`bl`},[(hn.value?`⛶`:`⛶`)]):null)])]),(ft(gj) > 0?G(`div`,{className:`bv`,style:K([(hl.value?`transform: translateX(0)`:``)])},[G(`div`,{className:`bw`},[`Playlist (`,gf(ft(gj)),` videos)`]),(()=>{const _0=[];const _1=gj;let _i=-1;for(let ma of _1){_i++;const mb=_i;_0.push(G(`div`,{"onClick":(mc)=>{return jm(mb)},className:(E(hf.value,mb)?`active`:``) + ` bx`},[G(`img`,{"src":ma.poster,"alt":ma.title,className:`by`}),G(`div`,{className:`bz`},[G(`div`,{className:`ca`},[ma.title]),G(`div`,{className:`cb`},[ku(ma.duration)])])]))};return _0})()]):null)])},md=(me,mf)=>{return (me.includes(mf))},BI=({mg=``,mh=`100%`,mi=`500px`,mj=false,mk=false,ml=true})=>{const mm=F(``),mn=F(``),mo=()=>{const mp=mq(mg);return D(()=>{mm.value=mp.platform;mn.value=mp.videoId})},mq=(mr)=>{return (md(mr,`youtube.com`) || md(mr,`youtu.be`)?f({platform:`youtube`,videoId:ms(mr)}):(md(mr,`vimeo.com`)?f({platform:`vimeo`,videoId:mt(mr)}):(md(mr,`dailymotion.com`) || md(mr,`dai.ly`)?f({platform:`dailymotion`,videoId:mu(mr)}):f({platform:`unknown`,videoId:``}))))},ms=(mv)=>{return ((() => {
      const url = mv;
      let videoId = '';

      // Standard youtube.com URL
      if (url.includes('youtube.com/watch?v=')) {
        videoId = url.split('v=')[1]?.split('&')[0] || '';
      }
      // Short youtu.be URL
      else if (url.includes('youtu.be/')) {
        videoId = url.split('youtu.be/')[1]?.split('?')[0] || '';
      }
      // Embed URL
      else if (url.includes('youtube.com/embed/')) {
        videoId = url.split('embed/')[1]?.split('?')[0] || '';
      }

      return videoId;
    })())},mt=(mw)=>{return ((() => {
      const url = mw;
      let videoId = '';

      // Standard vimeo.com URL
      if (url.includes('vimeo.com/')) {
        const parts = url.split('vimeo.com/');
        if (parts[1]) {
          videoId = parts[1].split('/')[0].split('?')[0] || '';
        }
      }

      return videoId;
    })())},mu=(mx)=>{return ((() => {
      const url = mx;
      let videoId = '';

      // Standard dailymotion.com URL
      if (url.includes('dailymotion.com/video/')) {
        videoId = url.split('video/')[1]?.split('_')[0] || '';
      }
      // Short dai.ly URL
      else if (url.includes('dai.ly/')) {
        videoId = url.split('dai.ly/')[1]?.split('?')[0] || '';
      }

      return videoId;
    })())},my=()=>{const mz=(mj?`1`:`0`);const na=(mk?`1`:`0`);const nb=(ml?`1`:`0`);return M(mm.value,[[`youtube`,()=>{return `https://www.youtube.com/embed/` + mn.value + `?autoplay=` + mz + `&mute=` + na + `&controls=` + nb}],[`vimeo`,()=>{return `https://player.vimeo.com/video/` + mn.value + `?autoplay=` + mz + `&muted=` + na + `&controls=` + nb}],[`dailymotion`,()=>{return `https://www.dailymotion.com/embed/video/` + mn.value + `?autoplay=` + mz + `&mute=` + na + `&controls=` + nb}],[null,()=>{return ``}]])},nc=()=>{const _={[`--a-a`]:mh,[`--a-b`]:mi};return _};H(()=>{(()=>{return mo()})()},[]);I(()=>{return mo()});return G(`div`,{className:`an`,style:K([nc()])},[(bn(mn.value) && bn(mm.value)?G(`iframe`,{"src":my(),"allow":`accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture`,"allowfullscreen":`true`,className:`ao`}):(bl(mg)?G(`div`,{className:`ap`},[G(`div`,{className:`aq`},[`🎬`]),G(`div`,{className:`ar`},[`Enter a video URL to start`]),G(`div`,{style:K([`font-size: 12px; color: var(--text-color, #999);`])},[`Supports YouTube, Vimeo, and Dailymotion`])]):G(`div`,{className:`ap`},[G(`div`,{className:`aq`},[`⚠️`]),G(`div`,{className:`ar`},[`Unsupported video platform`]),G(`div`,{style:K([`font-size: 12px; color: var(--text-color, #999);`])},[`Please use YouTube, Vimeo, or Dailymotion URLs`])])))])},BJ=()=>{return G(`div`,{className:`ce`},[G(`div`,{className:`cf`},[G(`h1`,{className:`cg`},[`🎬 Video Players`]),G(`p`,{className:`ch`},[`Professional video player with all advanced features: keyboard shortcuts, playlist, quality selector, subtitles, analytics, mini-player, PiP, and external platform support (YouTube, Vimeo)`])]),G(`div`,{className:`ci`},[G(`h2`,{className:`cj`},[`🚀 Pro Video Player`,G(`span`,{className:`cu`},[`Ultimate`])]),G(`div`,{className:`ck`},[G(`div`,{className:`cm`},[G(`h3`,{className:`cn`},[`Full-Featured Professional Player with Playlist`]),G(BH,{gk:[e({label:`1080p`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4`,height:1080}),e({label:`720p`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4`,height:720}),e({label:`480p`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4`,height:480})],gl:[d({label:`English`,src:`/captions/en.vtt`,language:`en`,isDefault:true})],gj:[g({id:`1`,title:`Big Buck Bunny`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4`,poster:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg`,duration:596}),g({id:`2`,title:`Elephants Dream`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4`,poster:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg`,duration:653}),g({id:`3`,title:`For Bigger Blazes`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4`,poster:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg`,duration:15})],gn:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg`,go:`100%`,gp:`600px`,gt:true,gu:true}),G(`p`,{className:`ct`},[`🔥 Professional player with: Keyboard shortcuts (Space, ←→ seek, ↑↓ volume, F fullscreen, M mute, J/L 10s jumps, 0-9 percentage jumps), seek preview, buffer indicator, playlist, mini-player mode, analytics tracking, and all controls!`])]),G(`div`,{className:`cm`},[G(`h3`,{className:`cn`},[`Pro Player - Single Video with Auto-play`]),G(BH,{gk:[e({label:`HD`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4`,height:720})],gn:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg`,go:`100%`,gp:`500px`,gq:true,gr:true,gt:true}),G(`p`,{className:`ct`},[`⚡ All pro features in a single video configuration`])])])]),G(`div`,{className:`ci`},[G(`h2`,{className:`cj`},[`🌐 Embed Player (YouTube, Vimeo, Dailymotion)`,G(`span`,{className:`cu`},[`External`])]),G(`div`,{className:`cl`},[G(`div`,{className:`cm`},[G(`h3`,{className:`cn`},[`YouTube Video`]),G(BI,{mg:`https://www.youtube.com/watch?v=dQw4w9WgXcQ`,mh:`100%`,mi:`400px`,ml:true}),G(`p`,{className:`ct`},[`📺 Supports standard YouTube URLs, short URLs (youtu.be), and embed URLs`])]),G(`div`,{className:`cm`},[G(`h3`,{className:`cn`},[`Vimeo Video`]),G(BI,{mg:`https://vimeo.com/148751763`,mh:`100%`,mi:`400px`,ml:true}),G(`p`,{className:`ct`},[`🎬 Clean Vimeo player integration with responsive design`])])])]),G(`div`,{className:`ci`},[G(`h2`,{className:`cj`},[`✨ Feature Comparison`]),G(`table`,{className:`cv`},[G(`thead`,{},[G(`tr`,{},[G(`th`,{className:`cw`},[`Feature`]),G(`th`,{className:`cw`},[`ProVideoPlayer`]),G(`th`,{className:`cw`},[`EmbedPlayer`])])]),G(`tbody`,{},[G(`tr`,{},[G(`td`,{className:`cx`},[`Play/Pause`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Progress Bar with Preview`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Hover preview`])]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Volume Control`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Slider + Mute`])]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Playback Speed`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ (0.25x - 2x)`])]),G(`td`,{className:`cx`},[`Platform-dependent`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Quality Selector`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Multi-source`])]),G(`td`,{className:`cx`},[`Platform-dependent`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Subtitles/Captions`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ VTT format`])]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Fullscreen`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ + Double-click`])]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Picture-in-Picture`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])]),G(`td`,{className:`cx`},[`Browser-dependent`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Keyboard Shortcuts`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ (15+ keys)`])]),G(`td`,{className:`cx`},[`Platform-dependent`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Buffer Indicator`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Visual bar`])]),G(`td`,{className:`cx`},[`Platform-dependent`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Playlist Support`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Auto-advance`])]),G(`td`,{className:`cx`},[`✗`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Mini-Player`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Floating mode`])]),G(`td`,{className:`cx`},[`✗`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Analytics Tracking`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ 5 metrics`])]),G(`td`,{className:`cx`},[`✗`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Loading State`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Spinner`])]),G(`td`,{className:`cx`},[`Platform-dependent`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Theme Integration`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])])]),G(`tr`,{},[G(`td`,{className:`cx`},[`External Platforms`]),G(`td`,{className:`cx`},[`✗`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ YouTube, Vimeo`])])])])])]),G(`div`,{className:`ci`},[G(`h2`,{className:`cj`},[`🎯 All Features`]),G(`div`,{className:`co`},[G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`▶️`]),G(`h3`,{className:`cr`},[`Play/Pause`]),G(`p`,{className:`cs`},[`Smooth playback control with visual feedback`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`⏱️`]),G(`h3`,{className:`cr`},[`Speed Control`]),G(`p`,{className:`cs`},[`0.25x to 2x playback speed`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🔊`]),G(`h3`,{className:`cr`},[`Volume`]),G(`p`,{className:`cs`},[`Slider control with mute toggle`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`⚙️`]),G(`h3`,{className:`cr`},[`Quality`]),G(`p`,{className:`cs`},[`Multiple quality options`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`CC`]),G(`h3`,{className:`cr`},[`Subtitles`]),G(`p`,{className:`cs`},[`VTT caption track support`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`⛶`]),G(`h3`,{className:`cr`},[`Fullscreen`]),G(`p`,{className:`cs`},[`Native fullscreen API`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`⧉`]),G(`h3`,{className:`cr`},[`PiP Mode`]),G(`p`,{className:`cs`},[`Picture-in-Picture support`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🎨`]),G(`h3`,{className:`cr`},[`Theming`]),G(`p`,{className:`cs`},[`Full CSS variable support`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`⌨️`]),G(`h3`,{className:`cr`},[`Keyboard`]),G(`p`,{className:`cs`},[`Space, arrows shortcuts`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`📱`]),G(`h3`,{className:`cr`},[`Responsive`]),G(`p`,{className:`cs`},[`Mobile-friendly design`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🌐`]),G(`h3`,{className:`cr`},[`Embeds`]),G(`p`,{className:`cs`},[`YouTube, Vimeo, Dailymotion`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`⚡`]),G(`h3`,{className:`cr`},[`Performance`]),G(`p`,{className:`cs`},[`Optimized HTML5 video`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🎮`]),G(`h3`,{className:`cr`},[`Playlist`]),G(`p`,{className:`cs`},[`Auto-advance queue system`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`📊`]),G(`h3`,{className:`cr`},[`Analytics`]),G(`p`,{className:`cs`},[`Track play, pause, seek, watch time`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🔍`]),G(`h3`,{className:`cr`},[`Seek Preview`]),G(`p`,{className:`cs`},[`Hover to preview timestamp`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`📦`]),G(`h3`,{className:`cr`},[`Buffer Bar`]),G(`p`,{className:`cs`},[`Visual buffering indicator`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🎬`]),G(`h3`,{className:`cr`},[`Mini Player`]),G(`p`,{className:`cs`},[`Floating player mode`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🎯`]),G(`h3`,{className:`cr`},[`Precise Control`]),G(`p`,{className:`cs`},[`Frame-accurate seeking`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🔢`]),G(`h3`,{className:`cr`},[`Jump to %`]),G(`p`,{className:`cs`},[`Press 0-9 for percentage`])])])])])},BK=({nd=o({data:[]}),ne=[50],nf=[100],ng=false,nh=0})=>{const ni=(nj)=>{return G(`div`,{"key":gf(nj.x) + `-` + gf(nj.y),style:K([`position: absolute; ` + `top: ` + gf(nj.y * 60) + `px; ` + `left: ` + gf(nj.x * 120) + `px; ` + `width: ` + gf(nj.col * 120 - 2) + `px; ` + `height: ` + gf(nj.row * 60 - 2) + `px; ` + `border: 1px solid #ddd; display: flex; align-items: center; justify-content: center; padding: 10px;`])},[nj.text])};return G(`div`,{style:K([`border: 1px solid #ddd; position: relative; height: 400px; width: 600px;`])},[(()=>{const _0=[];const _1=nd.data;let _i=-1;for(let nk of _1){_i++;_0.push(ni(nk))};return _0})()])},BL=()=>{const nl=()=>{return o({data:[n({x:0,y:0,col:1,row:1,text:`A1`,className:``}),n({x:1,y:0,col:1,row:1,text:`B1`,className:``}),n({x:2,y:0,col:1,row:1,text:`C1`,className:``}),n({x:0,y:1,col:1,row:1,text:`A2`,className:``}),n({x:1,y:1,col:1,row:1,text:`B2`,className:``}),n({x:2,y:1,col:1,row:1,text:`C2`,className:``}),n({x:0,y:2,col:1,row:1,text:`A3`,className:``}),n({x:1,y:2,col:1,row:1,text:`B3`,className:``}),n({x:2,y:2,col:1,row:1,text:`C3`,className:``})]})},nm=()=>{return o({data:[n({x:0,y:0,col:2,row:1,text:`Merged Header`,className:``}),n({x:2,y:0,col:1,row:2,text:`Tall Cell`,className:``}),n({x:0,y:1,col:1,row:1,text:`A2`,className:``}),n({x:1,y:1,col:1,row:1,text:`B2`,className:``}),n({x:0,y:2,col:3,row:1,text:`Wide Footer`,className:``})]})},nn=()=>{return o({data:[n({x:0,y:0,col:1,row:1,text:`Name`,className:`header-cell`}),n({x:1,y:0,col:1,row:1,text:`Age`,className:`header-cell`}),n({x:2,y:0,col:1,row:1,text:`City`,className:`header-cell`}),n({x:0,y:1,col:1,row:1,text:`Alice`,className:``}),n({x:1,y:1,col:1,row:1,text:`25`,className:``}),n({x:2,y:1,col:1,row:1,text:`NYC`,className:``}),n({x:0,y:2,col:1,row:1,text:`Bob`,className:``}),n({x:1,y:2,col:1,row:1,text:`30`,className:``}),n({x:2,y:2,col:1,row:1,text:`LA`,className:``}),n({x:0,y:3,col:1,row:1,text:`Carol`,className:``}),n({x:1,y:3,col:1,row:1,text:`28`,className:``}),n({x:2,y:3,col:1,row:1,text:`SF`,className:``})]})};return G(`div`,{className:`ix`},[G(`h1`,{className:`iy`},[`Matrix`,G(`span`,{className:`jf`},[`Grid Layout`])]),G(`p`,{className:`iz`},[`Flexible grid layout component with support for merged cells and fixed headers. `,`Perfect for complex table layouts and dashboard grids.`]),G(`ul`,{className:`jg`},[G(`li`,{className:`jh`},[`Support for merged cells (colspan/rowspan)`]),G(`li`,{className:`jh`},[`Fixed first column or row`]),G(`li`,{className:`jh`},[`Flexible cell sizing`]),G(`li`,{className:`jh`},[`Conflict detection for overlapping cells`]),G(`li`,{className:`jh`},[`Responsive scrolling`])]),G(`div`,{className:`ja`},[G(`h2`,{className:`jb`},[`Basic Grid`]),G(`p`,{className:`jc`},[`A simple 3x3 matrix with equal cell sizes.`]),G(`div`,{className:`jd`},[G(BK,{nd:nl(),nf:[120,120,120],ne:[60,60,60]})]),G(`div`,{className:`je`},[`data: [\n` + `  { x: 0, y: 0, col: 1, row: 1, text: "A1" },\n` + `  { x: 1, y: 0, col: 1, row: 1, text: "B1" },\n` + `  // ...\n` + `]`])]),G(`div`,{className:`ja`},[G(`h2`,{className:`jb`},[`Merged Cells`]),G(`p`,{className:`jc`},[`Cells can span multiple columns (col) or rows (row).`]),G(`div`,{className:`jd`},[G(BK,{nd:nm(),nf:[120,120,120],ne:[60,60,60]})]),G(`div`,{className:`je`},[`{ x: 0, y: 0, col: 2, row: 1, text: "Merged" }\n` + `{ x: 2, y: 0, col: 1, row: 2, text: "Tall Cell" }\n` + `{ x: 0, y: 2, col: 3, row: 1, text: "Wide Footer" }`])]),G(`div`,{className:`ja`},[G(`h2`,{className:`jb`},[`Table Layout`]),G(`p`,{className:`jc`},[`Use Matrix for table-like data with fixed headers.`]),G(`div`,{className:`jd`},[G(BK,{nd:nn(),nf:[150,100,150],ne:[50,45,45,45],ng:true,nh:200})]),G(`div`,{className:`je`},[`<Matrix\n` + `  data={tableData}\n` + `  fixFirstRow={true}\n` + `  maxHeight={200}\n` + `/>`])]),G(`div`,{className:`ja`},[G(`h2`,{className:`jb`},[`Properties`]),G(`div`,{className:`je`},[`data: MatrixData           - Grid data with cell definitions\n` + `cellWidth: Array(Number)   - Width for each column\n` + `cellHeight: Array(Number)  - Height for each row\n` + `fixFirstColumn: Bool       - Fix first column on scroll\n` + `fixFirstRow: Bool          - Fix first row on scroll\n` + `maxWidth: Number           - Max width with horizontal scroll\n` + `maxHeight: Number          - Max height with vertical scroll\n` + `width: Number              - Fixed matrix width\n` + `height: Number             - Fixed matrix height`])])])},BM=({no=[],np=``,nq=`line`,nr=`#1989fa`,ns=`#fff`,nt=300,nu=`40px`,nv=`3px`,nw=false,nx=false,ny=false,nz=false,oa=false,ob=0,oc=5,od=``,oe=`#646566`,of=true,og=false,oh=(oi)=>{return ci()},oj=(ok)=>{return ci()},ol=(om)=>{return ci()},on=(oo)=>{return ci()},op=(oq)=>{return true}})=>{const or=F(``),os=F(0),ot=F(``),ou=F(false),ov=F(0),ow=F(0),ox=F(0),oy=()=>{((() => {
      setTimeout(() => {
        const tabs = no;
        const currentActive = or.value;
        const lineWidth = nu;
        const lineHeight = nv;
        const shrink = og;

        const index = tabs.findIndex(tab => tab.name === currentActive);
        if (index < 0) return;

        const navElement = document.querySelector('[role="tablist"]');
        if (!navElement) return;

        const tabElements = navElement.querySelectorAll('[role="tab"]');
        if (index >= tabElements.length) return;

        const currentTab = tabElements[index];
        if (!currentTab) return;

        const tabRect = currentTab.getBoundingClientRect();
        const navRect = navElement.getBoundingClientRect();

        // Calculate position relative to nav container
        const left = tabRect.left - navRect.left + navElement.scrollLeft;

        // Calculate the line width
        const lineWidthPx = parseInt(lineWidth) || 40;

        // Center the line under the tab
        const tabCenter = left + (tabRect.width / 2);
        const lineLeft = tabCenter - (lineWidthPx / 2);

        const newStyle = "transform: translateX(" + lineLeft + "px); width: " + lineWidth + "; height: " + lineHeight + ";";
        (()=>{ot.value=(newStyle)})()

        // Auto-scroll to center active tab in shrink mode
        if (shrink) {
          const scrollLeft = navElement.scrollLeft;
          const tabCenter = tabRect.left - navRect.left + scrollLeft + (tabRect.width / 2);
          const navCenter = navRect.width / 2;
          const targetScroll = tabCenter - navCenter;

          navElement.scrollTo({
            left: targetScroll,
            behavior: 'smooth'
          });
        }
      }, 50);
    })());return ci()},oz=()=>{((() => {
      const sticky = ny;
      if (!sticky) return;

      const offsetTop = ob;

      const handleScroll = () => {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        const shouldBeFixed = scrollTop >= offsetTop;

        if (ou.value !== shouldBeFixed) {
          (()=>{ou.value=(shouldBeFixed)})()
          ol(m({scrollTop:(scrollTop),isFixed:(shouldBeFixed)}))
        }
      };

      window.addEventListener('scroll', handleScroll, { passive: true });
    })());return ci()},pa=(pb,pc,pd)=>{return (pb.disabled?on(l({name:pb.name,title:pb.title,index:pc,disabled:pb.disabled})):(()=>{oj(l({name:pb.name,title:pb.title,index:pc,disabled:pb.disabled}));(()=>{or.value=pb.name})();return oh(k({name:pb.name,title:pb.title,index:pc}))})())},pe=(pf)=>{((() => {
      const swipeable = nz;
      if (!swipeable) return;

      const touch = pf.touches[0];
      if (touch) {
        D(()=>{ov.value=(touch.clientX);ow.value=(touch.clientY)})
      }
    })());return ci()},pg=(ph)=>{((() => {
      const swipeable = nz;
      if (!swipeable) return;

      const touch = ph.touches[0];
      if (!touch) return;

      const deltaX = touch.clientX - ov.value;
      const deltaY = touch.clientY - ow.value;

      // If swiping vertically, don't interfere
      if (Math.abs(deltaY) > Math.abs(deltaX)) return;

      // Prevent default scroll when swiping horizontally
      ph.preventDefault();
    })());return ci()},pi=(pj)=>{((() => {
      const swipeable = nz;
      if (!swipeable) return;

      const touch = pj.changedTouches[0];
      if (!touch) return;

      const deltaX = touch.clientX - ov.value;
      const deltaY = touch.clientY - ow.value;

      // Only process horizontal swipes
      if (Math.abs(deltaY) > Math.abs(deltaX)) return;

      const threshold = oc || 5;
      const tabs = no;
      const currentIndex = tabs.findIndex(tab => tab.name === or.value);

      if (Math.abs(deltaX) > threshold) {
        if (deltaX > 0 && currentIndex > 0) {
          // Swipe right - go to previous tab
          const prevTab = tabs[currentIndex - 1];
          if (!prevTab.disabled) {
            pa((prevTab),(currentIndex - 1),pj)
          }
        } else if (deltaX < 0 && currentIndex < tabs.length - 1) {
          // Swipe left - go to next tab
          const nextTab = tabs[currentIndex + 1];
          if (!nextTab.disabled) {
            pa((nextTab),(currentIndex + 1),pj)
          }
        }
      }
    })());return ci()},pk=()=>{const _={[`--g-a`]:ns};return _},pl=()=>{const _={};(E(nq,`card`)?Object.assign(_,{[`--k-a`]:`0 16px`,[`--k-b`]:`2px`,[`--k-c`]:`var(--mint-background, #f7f8fa)`}):null);(og?Object.assign(_,{[`--k-d`]:`nowrap`}):Object.assign(_,{[`--k-e`]:`1`}));return _},pm=()=>{const _={};(!og?Object.assign(_,{[`--l-a`]:`1`}):null);return _},pn=(po,pp)=>{const _={[`--h-a`]:`all ` + gf(nt) + `ms`};(po?Object.assign(_,{[`--h-b`]:(bl(od)?nr:od),[`--h-c`]:`500`}):Object.assign(_,{[`--h-b`]:oe,[`--h-c`]:`400`}));(pp?Object.assign(_,{[`--h-b`]:`var(--mint-text-color-3, #c8c9cc)`,[`--h-d`]:`not-allowed`}):null);(og?Object.assign(_,{[`--h-e`]:`0 0 auto`,[`--h-f`]:`0 12px`}):null);(of?Object.assign(_,{[`--h-g`]:`nowrap`,[`--h-h`]:`hidden`,[`--h-i`]:`ellipsis`}):null);(po?Object.assign(_,{[`--m-a`]:`#fff`,[`--m-b`]:`2px`}):null);return _},pq=()=>{const _={[`--i-a`]:nr,[`--i-b`]:`all ` + gf(nt) + `ms`};return _},pr=()=>{const _={};(nw?Object.assign(_,{[`--n-a`]:`hidden`}):null);return _},ps=()=>{const _={[`--j-a`]:`transform ` + gf(nt) + `ms`,[`--j-b`]:`translateX(` + gf(ox.value) + `%)`};return _};H(()=>{(()=>{((() => {
      (()=>{or.value=np})()
      oz()
      oy()
    })());return ci()})()},[]);I(()=>{((() => {
      if (or.value !== np) {
        (()=>{or.value=np})()
        oy()
      }
    })());return ci()});return G(`div`,{},[G(`div`,{className:(ny && ou.value?`containerSticky`:``) + ` fo`,style:K([pk()])},[G(`div`,{className:`fp`,style:K([pl()])},[G(`div`,{"role":`tablist`,"onTouchStart":pe,"onTouchMove":pg,"onTouchEnd":pi,className:`fq`,style:K([pm()])},[(()=>{const _0=[];const _1=no;let _i=-1;for(let pt of _1){_i++;const pu=_i;_0.push(G(`div`,{"key":pt.name,"role":`tab`,"onClick":(pv)=>{return pa(pt,pu,pv)},className:`fr`,style:K([pn(E(pt.name,or.value),pt.disabled),pt.titleStyle])},[G(`span`,{className:`fs`},[(!bl(pt.icon)?G(`span`,{className:`ft`},[pt.icon]):null),pt.title,(pt.dot?G(`span`,{className:`fu`}):null),(!bl(pt.badge)?G(`span`,{className:`fv`},[pt.badge]):null)])]))};return _0})(),(E(nq,`line`)?G(`div`,{className:`fw`,style:K([pq(),ot.value])}):null)])])]),(nw?G(`div`,{className:`fx`,style:K([pr()])},[G(`div`,{className:`fy`,style:K([ps()])},[(()=>{const _0=[];const _1=no;let _i=-1;for(let pw of _1){_i++;const px=_i;_0.push(G(`div`,{"key":pw.name,className:`fz`},[(!bl(pw.content)?G(`div`,{},[pw.content]):null)]))};return _0})()])]):null)])},BN=()=>{const py=F(`tab1`),pz=F(`a`),qa=F(`card1`),qb=F(`badge1`),qc=()=>{return [j({name:`tab1`,title:`Tab 1`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`tab2`,title:`Tab 2`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`tab3`,title:`Tab 3`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`tab4`,title:`Tab 4`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``})]},qd=()=>{return [j({name:`a`,title:`Tab A`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`b`,title:`Tab B`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`c`,title:`Tab C`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``})]},qe=()=>{return [j({name:`badge1`,title:`Tab`,disabled:false,dot:true,badge:``,titleStyle:``,icon:``,content:``}),j({name:`badge2`,title:`Tab`,disabled:false,dot:false,badge:`5`,titleStyle:``,icon:``,content:``}),j({name:`badge3`,title:`Tab`,disabled:false,dot:false,badge:`99+`,titleStyle:``,icon:``,content:``})]},qf=(qg)=>{return (()=>{py.value=qg.name})()},qh=(qi)=>{return (()=>{pz.value=qi.name})()},qj=(qk)=>{return (()=>{qa.value=qk.name})()},ql=(qm)=>{return (()=>{qb.value=qm.name})()},qn=()=>{return G(`div`,{className:`fh`},[G(`h1`,{className:`fl`,style:K([qo()])},[`Tabs`,G(`span`,{className:`fn`},[`Navigation`])]),G(`p`,{className:`fm`,style:K([qp()])},[`Used to switch between different content areas.`]),G(`div`,{className:`fi`,style:K([qq()])},[G(`div`,{className:`fj`},[`Basic Usage`]),G(BM,{no:qc(),np:py.value,oh:qf}),G(`div`,{className:`fk`},[(E(py.value,`tab1`)?`Content of Tab 1`:(E(py.value,`tab2`)?`Content of Tab 2`:(E(py.value,`tab3`)?`Content of Tab 3`:`Content of Tab 4`)))])]),G(`div`,{className:`fi`,style:K([qq()])},[G(`div`,{className:`fj`},[`Match by name`]),G(BM,{no:qd(),np:pz.value,oh:qh}),G(`div`,{className:`fk`},[(E(pz.value,`a`)?`Content of Tab A`:(E(pz.value,`b`)?`Content of Tab B`:`Content of Tab C`))])]),G(`div`,{className:`fi`,style:K([qq()])},[G(`div`,{className:`fj`},[`Card Style`]),G(BM,{no:qc(),np:qa.value,nq:`card`,oh:qj}),G(`div`,{className:`fk`},[(E(qa.value,`tab1`)?`Card Style Tab 1`:(E(qa.value,`tab2`)?`Card Style Tab 2`:(E(qa.value,`tab3`)?`Card Style Tab 3`:`Card Style Tab 4`)))])]),G(`div`,{className:`fi`,style:K([qq()])},[G(`div`,{className:`fj`},[`Badge & Dot`]),G(BM,{no:qe(),np:qb.value,oh:ql}),G(`div`,{className:`fk`},[(E(qb.value,`badge1`)?`Tab with dot indicator`:(E(qb.value,`badge2`)?`Tab with badge count (5)`:`Tab with 99+ badge`))])])])},qr=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--c-a`]:`0`}):null);return _},qq=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--d-a`]:`16px`,[`--d-b`]:`0`}):null);return _},qo=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--e-a`]:`24px`,[`--e-b`]:`0 0 16px`,[`--e-c`]:`16px`}):null);return _},qp=()=>{const _={};(E(ae.value,`mobile`)?Object.assign(_,{[`--f-a`]:`14px`,[`--f-b`]:`22px`}):null);return _};return G(`div`,{className:`fa`,style:K([qr()])},[(E(ae.value,`mobile`)?G(`div`,{className:`fb`},[G(`div`,{className:`fd`},[G(`div`,{className:`fe`})]),G(`div`,{className:`ff`},[qn()])]):G(`div`,{className:`fb fc`},[G(`div`,{className:`ff fg`},[qn()])]))])},BO=({qs=h({name:``,tel:``,province:``,city:``,county:``,addressDetail:``,areaCode:``,isDefault:false}),qt=[],qu=false,qv=false,qw=false,qx=true,qy=true,qz=false,ra=`Save`,rb=`Delete`,rc=1,rd=200,re=20,rf=false,rg=false,rh=`Area`,ri=`Name`,rj=`Phone`,rk=`Detailed Address`,rl=(rm)=>{return r(null)},rn=(ro)=>{return r(null)},rp=(rq,rr)=>{return r(null)},rs=(rt)=>{return r(null)},ru=(rv)=>{return r(null)},rw=(rx)=>{return r(null)},ry=(rz)=>{return r(null)},sa=()=>{return r(null)},sb=(sc)=>{return true},sd=(se,sf)=>{return ``},sg=null,sh=[`Choose`,`Choose`,`Choose`]})=>{const si=F(``),sj=F(``),sk=F(``),sl=F(``),sm=F(``),sn=F(``),so=F(``),sp=F(false),sq=F(false),sr=F(``),ss=F(``),st=F(``),su=F(``),sv=(sw)=>{D(()=>{si.value=sw;sr.value=``});return rp(`name`,sw)},sx=(sy)=>{D(()=>{sj.value=sy;ss.value=``});return rp(`tel`,sy)},sz=(ta)=>{D(()=>{sn.value=ta;su.value=``});return rs(ta)},tb=(tc)=>{return ry(`name`)},td=(te)=>{return ry(`tel`)},tf=(tg)=>{return ry(`addressDetail`)},th=(ti)=>{((() => {
      const value = event.target.value || "";
      sv((value))
    })());return r(null)},tj=(tk)=>{((() => {
      const value = event.target.value || "";
      sx((value))
    })());return r(null)},tl=(tm)=>{((() => {
      const value = event.target.value || "";
      sz((value))
    })());return r(null)},tn=(to)=>{((() => {
      const newValue = !sp.value;
      tp((newValue))
    })());return r(null)},tp=(tq)=>{(()=>{sp.value=tq})();return ru(tq)},tr=(ts)=>{return (!qz?(()=>{(()=>{sq.value=true})();return sa()})():r(null))},tt=()=>{return (()=>{sr.value=`Please fill in the name`})()},tu=(tv)=>{return (()=>{sr.value=tv})()},tw=(tx)=>{return (()=>{ss.value=tx})()},ty=()=>{return (()=>{st.value=`Please select area`})()},tz=()=>{return (()=>{su.value=`Please fill in the address`})()},ua=()=>{return D(()=>{sr.value=``;ss.value=``;st.value=``;su.value=``})},ub=()=>{return h({name:si.value,tel:sj.value,province:sk.value,city:sl.value,county:sm.value,addressDetail:sn.value,areaCode:so.value,isDefault:sp.value})},uc=()=>{((() => {
      const nameValidationError = sd(`name`,si.value);
      const telValidationError = sd(`tel`,sj.value);
      const telValid = sb(sj.value);

      if (bl(si.value)) {
        tt()
      } else if (nameValidationError) {
        tu((nameValidationError))
      } else if (bl(sj.value)) {
        tw(`Please fill in the phone`)
      } else if (!telValid) {
        tw(`Invalid phone number`)
      } else if (telValidationError) {
        tw((telValidationError))
      } else if (qx && bl(so.value)) {
        ty()
      } else if (qy && bl(sn.value)) {
        tz()
      } else {
        rl(ub())
      }
    })());return r(null)},ud=(ue)=>{(event.preventDefault());ua();return uc()},uf=(ug)=>{(event.preventDefault());return rn(ub())},uh=(ui)=>{(()=>{sn.value=ui.address})();return rw(ui)},uj=()=>{return (bn(sk.value) && bn(sl.value) && bn(sm.value)?sk.value + ` ` + sl.value + ` ` + sm.value:(bn(so.value)?`Selected`:``))};H(()=>{(()=>{return D(()=>{si.value=qs.name;sj.value=qs.tel;sk.value=qs.province;sl.value=qs.city;sm.value=qs.county;sn.value=qs.addressDetail;so.value=qs.areaCode;sp.value=qs.isDefault})})()},[]);return G(`div`,{className:`cz`},[G(`form`,{"onSubmit":ud,className:`da`},[G(`div`,{className:`db`},[G(`div`,{className:`dc`},[G(`div`,{className:`dd`},[`Name`]),G(`div`,{className:`de`},[G(`input`,{"type":`text`,"value":si.value,"placeholder":ri,"onFocus":tb,"onChange":th,className:`df`})])]),(bn(sr.value)?G(`div`,{className:`dj`},[sr.value]):null),G(`div`,{className:`dc`},[G(`div`,{className:`dd`},[`Phone`]),G(`div`,{className:`de`},[G(`input`,{"type":`tel`,"value":sj.value,"placeholder":rj,"maxlength":gf(re),"onFocus":td,"onChange":tj,className:`df`})])]),(bn(ss.value)?G(`div`,{className:`dj`},[ss.value]):null),(qx?(()=>{G(`div`,{"onClick":tr,className:`dc`},[G(`div`,{className:`dd`},[`Area`]),G(`div`,{className:`de`},[G(`input`,{"type":`text`,"value":uj(),"placeholder":rh,readOnly:true,"disabled":qz,className:`df`}),G(`span`,{className:`dk`},[`›`])])]);return (bn(st.value)?G(`div`,{className:`dj`},[st.value]):null)})():null)]),(qy?(()=>{G(`div`,{className:`dg`},[G(`div`,{className:`dh`},[`Detailed Address`]),G(`textarea`,{"value":sn.value,"placeholder":rk,"rows":gf(rc),"maxlength":gf(rd),"onFocus":tf,"onChange":tl,className:`di`})]);return (bn(su.value)?G(`div`,{className:`dj`},[su.value]):null)})():null),sg,(qw && ft(qt) > 0?G(`div`,{className:`du`},[(()=>{const _0=[];const _1=qt;let _i=-1;for(let uk of _1){_i++;_0.push(G(`div`,{"onClick":(ul)=>{return uh(uk)},className:`dv`},[G(`div`,{className:`dw`},[uk.name]),G(`div`,{className:`dx`},[uk.address])]))};return _0})()]):null),(qv?G(`div`,{className:`dl`},[G(`span`,{className:`dm`},[`Set as the default address`]),G(`div`,{"onClick":tn,className:(sp.value?`switchOn`:``) + ` dn`},[G(`div`,{className:(sp.value?`switchNodeOn`:``) + ` dp`})])]):null),G(`div`,{className:`dq`},[G(`button`,{"type":`submit`,"disabled":rf,className:`dr ds`},[(rf?G(`div`,{className:`dy`}):null),G(`span`,{},[ra])]),(qu?G(`button`,{"type":`button`,"disabled":rg,"onClick":uf,className:`dr dt`},[(rg?G(`div`,{className:`dy dz`}):null),G(`span`,{},[rb])]):null)])])])},BP=()=>{const um=F([]),un=F(h({name:`John Doe`,tel:`+1 234-567-8900`,province:`California`,city:`Los Angeles`,county:`Los Angeles County`,addressDetail:`123 Main Street, Apt 4B, Building A`,areaCode:`90001`,isDefault:true})),uo=F(h({name:``,tel:``,province:``,city:``,county:``,addressDetail:``,areaCode:``,isDefault:false})),up=F(false),uq=F(``),ur=F(`filled`),us=()=>{return (()=>{up.value=false})()},ut=(uu)=>{return D(()=>{up.value=true;uq.value=uu})},uv=(uw)=>{((() => {
      ut(uw)

      setTimeout(() => {
        us()
      }, 2000);
    })());return r(null)},ux=(uy)=>{return uv(`Address saved!`)},uz=(va)=>{return uv(`Address deleted!`)},vb=(vc,vd)=>{return r(null)},ve=(vf)=>{return (bn(vf)?(()=>{um.value=[i({name:`Home`,address:`123 Main Street, Apt 4B`}),i({name:`Work`,address:`456 Business Ave, Suite 100`})]})():(()=>{um.value=[]})())},vg=(vh)=>{return r(null)},vi=(vj)=>{(()=>{um.value=[]})();return uv(`Selected: ` + vj.name)},vk=(vl)=>{return (()=>{ur.value=`filled`})()},vm=(vn)=>{return (()=>{ur.value=`empty`})()},vo=()=>{return (E(ur.value,`filled`)?un.value:uo.value)};return G(`div`,{className:`ea`},[G(`div`,{className:`eb`},[G(`h1`,{className:`ec`},[`📍 AddressEdit`]),G(`p`,{className:`ed`},[`Create, update, and delete receiving addresses with validation and search functionality`])]),G(`div`,{className:`ee`},[G(`div`,{className:`ef`},[G(`h2`,{className:`eg`},[`📱 Basic Usage`,G(`span`,{className:`eh`},[`Mobile`])]),G(`div`,{className:`ey`},[G(`button`,{"onClick":vk,className:(E(ur.value,`filled`)?`tabButtonActive`:``) + ` ez`},[`With Data`]),G(`button`,{"onClick":vm,className:(E(ur.value,`empty`)?`tabButtonActive`:``) + ` ez`},[`Empty Form`])]),G(`div`,{className:`ei`},[(E(ae.value,`mobile`)?G(`div`,{className:`ej`},[G(`div`,{className:`el`},[G(`div`,{className:`em`})]),G(`div`,{className:`en`},[G(BO,{qs:vo(),qt:um.value,qu:true,qv:true,qw:ft(um.value) > 0,qx:true,qy:true,ri:`Name`,rj:`Phone`,rh:`Area`,rk:`Address`,ra:`Save Address`,rb:`Delete Address`,rl:ux,rn:uz,rp:vb,rs:ve,ru:vg,rw:vi})])]):G(`div`,{className:`ej ek`},[G(`div`,{className:`en eo`},[G(BO,{qs:vo(),qt:um.value,qu:true,qv:true,qw:ft(um.value) > 0,qx:true,qy:true,ri:`Name`,rj:`Phone`,rh:`Area`,rk:`Address`,ra:`Save Address`,rb:`Delete Address`,rl:ux,rn:uz,rp:vb,rs:ve,ru:vg,rw:vi})])]))]),G(`div`,{className:`ex`},[(E(ae.value,`mobile`)?`💡 Mobile view: Switch between 'With Data' and 'Empty Form' to see different states. Try typing in the 'Address' field to see search suggestions. Use the navbar toggle to switch to Desktop view.`:`💡 Desktop view: This shows how the component looks on larger screens. Switch to Mobile view using the navbar toggle to see the mobile-optimized design.`)]),G(`div`,{className:`ep`},[`<AddressEdit\n`,`  addressInfo={addressInfo}\n`,`  searchResult={searchResult}\n`,`  showDelete={true}\n`,`  showSetDefault={true}\n`,`  showSearchResult={true}\n`,`  onSave={handleSave}\n`,`  onDelete={handleDelete}\n`,`  onChangeDetail={handleChangeDetail}/>`])]),G(`div`,{className:`ef`},[G(`h2`,{className:`eg`},[`📋 Props`]),G(`table`,{className:`eq`},[G(`thead`,{className:`er`},[G(`tr`,{},[G(`th`,{className:`es`},[`Attribute`]),G(`th`,{className:`es`},[`Description`]),G(`th`,{className:`es`},[`Type`]),G(`th`,{className:`es`},[`Default`])])]),G(`tbody`,{},[G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`addressInfo`]),G(`td`,{className:`eu`},[`Address information object`]),G(`td`,{className:`ev`},[`AddressEditInfo`]),G(`td`,{className:`ev`},[`{}`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`searchResult`]),G(`td`,{className:`eu`},[`Address search results`]),G(`td`,{className:`ev`},[`Array(AddressEditSearchItem)`]),G(`td`,{className:`ev`},[`[]`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`showDelete`]),G(`td`,{className:`eu`},[`Whether to show delete button`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`false`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`showSetDefault`]),G(`td`,{className:`eu`},[`Whether to show default address switch`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`false`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`showSearchResult`]),G(`td`,{className:`eu`},[`Whether to show search results`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`false`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`showArea`]),G(`td`,{className:`eu`},[`Whether to show area field`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`true`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`showDetail`]),G(`td`,{className:`eu`},[`Whether to show detail field`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`true`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`disableArea`]),G(`td`,{className:`eu`},[`Whether to disable area select`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`false`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`isSaving`]),G(`td`,{className:`eu`},[`Show save button loading status`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`false`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`isDeleting`]),G(`td`,{className:`eu`},[`Show delete button loading status`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`false`])])])])]),G(`div`,{className:`ef`},[G(`h2`,{className:`eg`},[`⚡ Events`]),G(`table`,{className:`eq`},[G(`thead`,{className:`er`},[G(`tr`,{},[G(`th`,{className:`es`},[`Event`]),G(`th`,{className:`es`},[`Description`]),G(`th`,{className:`es`},[`Arguments`])])]),G(`tbody`,{},[G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`onSave`]),G(`td`,{className:`eu`},[`Emitted when save button is clicked`]),G(`td`,{className:`ev`},[`info: AddressEditInfo`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`onDelete`]),G(`td`,{className:`eu`},[`Emitted when delete is confirmed`]),G(`td`,{className:`ev`},[`info: AddressEditInfo`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`onChange`]),G(`td`,{className:`eu`},[`Emitted when name or tel field changes`]),G(`td`,{className:`ev`},[`key: String, value: String`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`onChangeDetail`]),G(`td`,{className:`eu`},[`Emitted when address detail changes`]),G(`td`,{className:`ev`},[`value: String`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`onChangeDefault`]),G(`td`,{className:`eu`},[`Emitted when switching default address`]),G(`td`,{className:`ev`},[`checked: Bool`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`onSelectSearch`]),G(`td`,{className:`eu`},[`Emitted when search result is selected`]),G(`td`,{className:`ev`},[`item: AddressEditSearchItem`])])])])]),G(`div`,{className:`ef`},[G(`h2`,{className:`eg`},[`📦 Types`]),G(`div`,{className:`ep`},[`type AddressEditInfo {\n`,`  name: String,\n`,`  tel: String,\n`,`  province: String,\n`,`  city: String,\n`,`  county: String,\n`,`  addressDetail: String,\n`,`  areaCode: String,\n`,`  isDefault: Bool\n`,`}\n\n`,`type AddressEditSearchItem {\n`,`  name: String,\n`,`  address: String\n`,`}`])]),G(`div`,{className:`ef`},[G(`h2`,{className:`eg`},[`🎨 CSS Variables`]),G(`table`,{className:`eq`},[G(`thead`,{className:`er`},[G(`tr`,{},[G(`th`,{className:`es`},[`Name`]),G(`th`,{className:`es`},[`Default Value`]),G(`th`,{className:`es`},[`Description`])])]),G(`tbody`,{},[G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-address-edit-padding`]),G(`td`,{className:`ev`},[`var(--mint-padding-sm, 12px)`]),G(`td`,{className:`eu`},[`Form fields padding`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-address-edit-buttons-padding`]),G(`td`,{className:`ev`},[`16px 16px`]),G(`td`,{className:`eu`},[`Buttons container padding`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-address-edit-button-margin-bottom`]),G(`td`,{className:`ev`},[`12px`]),G(`td`,{className:`eu`},[`Button margin bottom`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-address-edit-button-font-size`]),G(`td`,{className:`ev`},[`var(--mint-font-size-lg, 16px)`]),G(`td`,{className:`eu`},[`Button font size`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-primary-color`]),G(`td`,{className:`ev`},[`#1989fa`]),G(`td`,{className:`eu`},[`Primary color for buttons and switch`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-danger-color`]),G(`td`,{className:`ev`},[`#ee0a24`]),G(`td`,{className:`eu`},[`Danger color for delete and errors`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-background`]),G(`td`,{className:`ev`},[`#f7f8fa`]),G(`td`,{className:`eu`},[`Background color`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-border-color`]),G(`td`,{className:`ev`},[`#ebedf0`]),G(`td`,{className:`eu`},[`Border color`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-text-color`]),G(`td`,{className:`ev`},[`#323233`]),G(`td`,{className:`eu`},[`Primary text color`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-text-color-2`]),G(`td`,{className:`ev`},[`#969799`]),G(`td`,{className:`eu`},[`Secondary text color`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-text-color-3`]),G(`td`,{className:`ev`},[`#c8c9cc`]),G(`td`,{className:`eu`},[`Placeholder text color`])])])])])]),(up.value?G(`div`,{className:`ew`},[uq.value]):null)])},vp=()=>{return null},BQ=({vq=`fadeIn`,vr=0.6,vs=`ease-out`,vt=0,vu=vp()})=>{const vv=()=>{const _={[`--ae-a`]:vq,[`--ae-b`]:gf(vr) + `s`,[`--ae-c`]:vs,[`--ae-d`]:gf(vt) + `s`};return _};return G(J,{},[G(`div`,{className:`jn`,style:K([`display:none;`])}),G(`div`,{className:`jo`,style:K([`display:none;`])}),G(`div`,{className:`jp`,style:K([`display:none;`])}),G(`div`,{className:`jq`,style:K([`display:none;`])}),G(`div`,{className:`jr`,style:K([`display:none;`])}),G(`div`,{className:`js`,style:K([`display:none;`])}),G(`div`,{className:`jt`,style:K([`display:none;`])}),G(`div`,{className:`ju`,style:K([`display:none;`])}),G(`div`,{className:`jv`,style:K([vv()])},[vu])])},vw=(vx)=>{return ((() => {
      if (vx.trim() === '') {
        return new T()
      }

      const value = Number(vx)

      if (Number.isNaN(value)) {
        return new T()
      }

      return P(S)((value))
    })())},vy=(vz)=>{return ((() => {
      let value = vz.value

      if (typeof value === "string") {
        return value
      } else {
        return ""
      }
    })())},wa=(wb,wc)=>{return (wb.split(wc))},wd=(we)=>{return (we.length)},wf=(wg,wh)=>{return (Math.min(wg, wh))},wi=(wj,wk)=>{return (Math.max(wj, wk))},wl=(wm,wn,wo)=>{return wf(wo,wi(wn,wm))},wp=(wq,wr)=>{return (wq.slice(wl(0,wr,wd(wq))))},ws=(wt,wu)=>{return (wt.startsWith(wu))},wv=(ww,wx,wy)=>{return (wy >= wd(ww)?P(S)(ww):(()=>{const wz=(ww.substring(wy, wy + 1));return (E(wz,wx)?P(S)((ww.substring(0, wy + 1))):wv(ww,wx,wy + 1))})())},xa=(xb)=>{return (ws(xb,`"`)?wv(xb,`"`,1):(ws(xb,`'`)?wv(xb,`'`,1):new T()))},xc=(xd,xe,xf)=>{return (xd.replace(xe, xf))},xg=(xh)=>{return xc(xc(xc(xh,`&`,`&amp;`),`<`,`&lt;`),`>`,`&gt;`)},xi=(xj,xk)=>{return `<span style='color: ` + xk + `;'>` + xg(xj) + `</span>`},xl=(xm)=>{return (bl(xm)?false:((() => { const c = xm.charCodeAt(0); return (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122) || c === 95; })()))},xn=(xo,xp)=>{return (xp >= wd(xo)?P(S)((xo.substring(0, xp))):(()=>{const xq=(xo.substring(xp, xp + 1));return (xl(xq)?xn(xo,xp + 1):P(S)((xo.substring(0, xp))))})())},xr=(xs)=>{const xt=(xs.substring(0, 1));return (xl(xt)?xn(xs,1):new T())},xu=(xv,xw)=>{return Q((()=>{const _0=[];const _1=xv;let _i=-1;for(let xx of _1){_i++;const _2=xw(xx);if(!_2){continue};_0.push(xx)};return _0})(),0,S,T)},xy=(xz,ya)=>{return !E(xu(xz,ya),new T())},yb=(yc,yd)=>{return xy(yc,(ye)=>{return E(ye,yd)})},yf=(yg,yh,yi,yj,yk)=>{return (yj >= wd(yg)?yk:(()=>{const yl=wp(yg,yj);return M(xa(yl),[[N(S,[O]),(ym)=>{return (()=>{const yn=wd(ym);const yo=xi(ym,`#CE9178`);return yf(yg,yh,yi,yj + yn,yk + yo)})()}],[N(T,[]),()=>{return M(xr(yl),[[N(S,[O]),(yp)=>{return (()=>{const yq=wd(yp);const yr=(yb(yh,yp)?xi(yp,`#C586C0`):(yb(yi,yp)?xi(yp,`#4EC9B0`):xi(yp,`#9CDCFE`)));return yf(yg,yh,yi,yj + yq,yk + yr)})()}],[N(T,[]),()=>{return (()=>{const ys=(yl.substring(0, 1));const yt=xi(ys,`#D4D4D4`);return yf(yg,yh,yi,yj + 1,yk + yt)})()}]])}]])})())},yu=(yv,yw,yx)=>{return yf(yv,yw,yx,0,``)},yy=(yz,za,zb,zc,zd)=>{return (zc >= ft(yz)?zd:M(gc(yz,zc),[[N(S,[O]),(ze)=>{return (()=>{const zf=yu(ze,za,zb);const zg=(zc < ft(yz) - 1?zf + `\n`:zf);return yy(yz,za,zb,zc + 1,zd + zg)})()}],[N(T,[]),()=>{return yy(yz,za,zb,zc + 1,zd)}]]))},zh=(zi,zj,zk)=>{const zl=wa(zi,`\n`);return yy(zl,zj,zk,0,``)},zm=(zn)=>{return zh(zn,[`module`,`component`,`fun`,`property`,`state`,`const`,`if`,`else`,`case`,`for`,`of`,`do`,`next`,`let`,`try`,`catch`,`where`,`return`,`await`,`encode`,`decode`,`style`,`connect`,`exposing`,`use`,`provider`,`subscription`,`sequence`],[`String`,`Number`,`Bool`,`Array`,`Maybe`,`Result`,`Promise`,`Html`,`Void`,`Time`,`Tuple`])},zo=(zp)=>{return zh(zp,[`import`,`from`,`to`,`important`,`media`,`keyframes`,`and`,`not`,`only`],[`color`,`background`,`background-color`,`border`,`border-radius`,`margin`,`padding`,`width`,`height`,`display`,`position`,`top`,`right`,`bottom`,`left`,`flex`,`grid`,`font`,`font-size`,`font-weight`,`opacity`,`transform`,`transition`,`animation`,`animation-name`,`animation-duration`,`animation-timing-function`,`animation-delay`,`animation-fill-mode`])},BR=({zq=``,zr=`mint`,zs=false})=>{const zt=()=>{return (navigator.clipboard.writeText(zq))},zu=()=>{return (E(zr,`mint`)?zm(zq):(E(zr,`css`)?zo(zq):xg(zq)))};return G(`div`,{className:`lq`},[(zs?G(`button`,{"onClick":(zv)=>{return zt()},className:`lr`},[`📋 Copy`]):null),G(`div`,{"dangerouslySetInnerHTML":({__html: zu()})})])},BS=()=>{const zw=F(`fadeIn`),zx=F(0),zy=F(0.6),zz=F(0),aaa=F(`ease-out`),aab=F(`preview`),aac=()=>{return [p({id:`fadeIn`,label:`Fade In`,code:`opacity: 0 → 1`}),p({id:`fadeInUp`,label:`Fade In Up`,code:`opacity: 0, translateY(30px) → opacity: 1, translateY(0)`}),p({id:`fadeInDown`,label:`Fade In Down`,code:`opacity: 0, translateY(-30px) → opacity: 1, translateY(0)`}),p({id:`slideInRight`,label:`Slide In Right`,code:`translateX(30px) → translateX(0)`}),p({id:`slideInLeft`,label:`Slide In Left`,code:`translateX(-30px) → translateX(0)`}),p({id:`scaleIn`,label:`Scale In`,code:`scale(0.9) → scale(1)`}),p({id:`zoomIn`,label:`Zoom In`,code:`scale(0) → scale(1)`}),p({id:`rotateIn`,label:`Rotate In`,code:`rotate(-180deg) → rotate(0)`})]},aad=(aae)=>{return D(()=>{zw.value=aae;zx.value=zx.value + 1})},aaf=()=>{return (()=>{zx.value=zx.value + 1})()},aag=(aah)=>{return (()=>{zy.value=fv(vw(aah),0.6)})()},aai=(aaj)=>{return (()=>{zz.value=fv(vw(aaj),0)})()},aak=(aal)=>{return (()=>{aaa.value=aal})()},aam=(aan)=>{return (()=>{aab.value=aan})()},aao=()=>{return `/* Import the component (automatic in Mint) */\n` + `component MyPage {\n` + `  state key : Number = 0\n\n` + `  fun replay : Promise(Void) {\n` + `    next { key: key + 1 }\n` + `  }\n\n` + `  fun render : Html {\n` + `    <EnterExit\n` + `      animation="${zw.value}"\n` + `      duration={${gf(zy.value)}}\n` + `      easing="${aaa.value}"\n` + `      delay={${gf(zz.value)}}\n` + `      key={Number.toString(key)}\n` + `      content={\n` + `        <div>\n` + `          "Your content here"\n` + `        </div>\n` + `      }/>\n` + `  }\n` + `}`},aap=()=>{return (E(zw.value,`fadeIn`)?`@keyframes fadeIn {\n` + `  from {\n` + `    opacity: 0;\n` + `  }\n` + `  to {\n` + `    opacity: 1;\n` + `  }\n` + `}`:(E(zw.value,`fadeInUp`)?`@keyframes fadeInUp {\n` + `  from {\n` + `    opacity: 0;\n` + `    transform: translateY(30px);\n` + `  }\n` + `  to {\n` + `    opacity: 1;\n` + `    transform: translateY(0);\n` + `  }\n` + `}`:(E(zw.value,`fadeInDown`)?`@keyframes fadeInDown {\n` + `  from {\n` + `    opacity: 0;\n` + `    transform: translateY(-30px);\n` + `  }\n` + `  to {\n` + `    opacity: 1;\n` + `    transform: translateY(0);\n` + `  }\n` + `}`:(E(zw.value,`slideInRight`)?`@keyframes slideInRight {\n` + `  from {\n` + `    opacity: 0;\n` + `    transform: translateX(30px);\n` + `  }\n` + `  to {\n` + `    opacity: 1;\n` + `    transform: translateX(0);\n` + `  }\n` + `}`:(E(zw.value,`slideInLeft`)?`@keyframes slideInLeft {\n` + `  from {\n` + `    opacity: 0;\n` + `    transform: translateX(-30px);\n` + `  }\n` + `  to {\n` + `    opacity: 1;\n` + `    transform: translateX(0);\n` + `  }\n` + `}`:(E(zw.value,`scaleIn`)?`@keyframes scaleIn {\n` + `  from {\n` + `    opacity: 0;\n` + `    transform: scale(0.9);\n` + `  }\n` + `  to {\n` + `    opacity: 1;\n` + `    transform: scale(1);\n` + `  }\n` + `}`:(E(zw.value,`zoomIn`)?`@keyframes zoomIn {\n` + `  from {\n` + `    opacity: 0;\n` + `    transform: scale(0);\n` + `  }\n` + `  to {\n` + `    opacity: 1;\n` + `    transform: scale(1);\n` + `  }\n` + `}`:`@keyframes rotateIn {\n` + `  from {\n` + `    opacity: 0;\n` + `    transform: rotate(-180deg);\n` + `  }\n` + `  to {\n` + `    opacity: 1;\n` + `    transform: rotate(0);\n` + `  }\n` + `}`)))))))};return G(`div`,{className:`jw`},[G(`h1`,{className:`jx`},[`EnterExit`,G(`span`,{className:`lg`},[`Component`])]),G(`p`,{className:`jy`},[`Create smooth enter and exit animations for your elements. `,`Adjust duration, delay, and easing to see the effects in real-time.`]),G(`div`,{className:`lo`},[G(`button`,{"onClick":(aaq)=>{return aam(`preview`)},className:(E(aab.value,`preview`)?`tabActive`:``) + ` lp`},[`Preview`]),G(`button`,{"onClick":(aar)=>{return aam(`usage`)},className:(E(aab.value,`usage`)?`tabActive`:``) + ` lp`},[`Usage`]),G(`button`,{"onClick":(aas)=>{return aam(`api`)},className:(E(aab.value,`api`)?`tabActive`:``) + ` lp`},[`API`]),G(`button`,{"onClick":(aat)=>{return aam(`animations`)},className:(E(aab.value,`animations`)?`tabActive`:``) + ` lp`},[`Animations`])]),(E(aab.value,`preview`)?G(`div`,{},[G(`div`,{},[G(`h3`,{className:`ks`},[`Choose Animation Type`]),G(`div`,{className:`kz`},[(()=>{const _0=[];const _1=aac();let _i=-1;for(let aau of _1){_i++;_0.push(G(`div`,{"onClick":(aav)=>{return aad(aau.id)},className:(E(zw.value,aau.id)?`animationCardActive`:``) + ` la`},[G(`div`,{className:`lb`},[aau.label]),G(`div`,{className:`lc`},[aau.code])]))};return _0})()])]),G(`div`,{className:`jz`},[(E(ae.value,`mobile`)?G(`div`,{className:`ka`},[G(`div`,{className:`ki`},[G(`div`,{className:`kj`})]),G(`div`,{className:`kk`},[G(`div`,{className:`km`},[G(BQ,{vq:zw.value,vr:zy.value,vs:aaa.value,vt:zz.value,"key":gf(zx.value),vu:G(`div`,{className:`ko`},[`Preview`])})]),G(`div`,{className:`kq`},[G(`h3`,{className:`ks`},[`Controls`]),G(`div`,{className:`kt`},[G(`label`,{className:`ku`},[`Duration`,G(`span`,{className:`kv`},[gf(zy.value) + `s`])]),G(`input`,{"type":`range`,"min":`0.1`,"max":`3`,"step":`0.1`,"value":gf(zy.value),"onInput":(aaw)=>{return aag(vy(aaw.target))},className:`kw`})]),G(`div`,{className:`kt`},[G(`label`,{className:`ku`},[`Delay`,G(`span`,{className:`kv`},[gf(zz.value) + `s`])]),G(`input`,{"type":`range`,"min":`0`,"max":`2`,"step":`0.1`,"value":gf(zz.value),"onInput":(aax)=>{return aai(vy(aax.target))},className:`kw`})]),G(`div`,{className:`kt`},[G(`label`,{className:`ku`},[`Easing`]),G(`select`,{"value":aaa.value,"onChange":(aay)=>{return aak(vy(aay.target))},className:`kx`},[G(`option`,{"value":`ease-out`},[`ease-out`]),G(`option`,{"value":`ease-in`},[`ease-in`]),G(`option`,{"value":`ease-in-out`},[`ease-in-out`]),G(`option`,{"value":`linear`},[`linear`])])]),G(`button`,{"onClick":(aaz)=>{return aaf()},className:`ky`},[`▶ Replay`])])])]):G(`div`,{className:`ka kb`},[G(`div`,{className:`kc`},[G(`div`,{className:`kd ke`}),G(`div`,{className:`kd kf`}),G(`div`,{className:`kd kg`}),G(`div`,{className:`kh`},[`🔒 localhost:3000/animations/enter-exit`])]),G(`div`,{className:`kk kl`},[G(`div`,{className:`kn`},[G(BQ,{vq:zw.value,vr:zy.value,vs:aaa.value,vt:zz.value,"key":gf(zx.value),vu:G(`div`,{className:`ko kp`},[`Preview`])})]),G(`div`,{className:`kr`},[G(`h3`,{className:`ks`},[`Animation Controls`]),G(`div`,{className:`kt`},[G(`label`,{className:`ku`},[`Duration`,G(`span`,{className:`kv`},[gf(zy.value) + `s`])]),G(`input`,{"type":`range`,"min":`0.1`,"max":`3`,"step":`0.1`,"value":gf(zy.value),"onInput":(aba)=>{return aag(vy(aba.target))},className:`kw`})]),G(`div`,{className:`kt`},[G(`label`,{className:`ku`},[`Delay`,G(`span`,{className:`kv`},[gf(zz.value) + `s`])]),G(`input`,{"type":`range`,"min":`0`,"max":`2`,"step":`0.1`,"value":gf(zz.value),"onInput":(abb)=>{return aai(vy(abb.target))},className:`kw`})]),G(`div`,{className:`kt`},[G(`label`,{className:`ku`},[`Easing Function`]),G(`select`,{"value":aaa.value,"onChange":(abc)=>{return aak(vy(abc.target))},className:`kx`},[G(`option`,{"value":`ease-out`},[`ease-out`]),G(`option`,{"value":`ease-in`},[`ease-in`]),G(`option`,{"value":`ease-in-out`},[`ease-in-out`]),G(`option`,{"value":`linear`},[`linear`]),G(`option`,{"value":`cubic-bezier(0.4, 0, 0.2, 1)`},[`cubic-bezier (smooth)`])])]),G(`button`,{"onClick":(abd)=>{return aaf()},className:`ky`},[`▶ Replay Animation`])])])]))])]):(E(aab.value,`usage`)?G(`div`,{},[G(`div`,{className:`lh`},[G(`h3`,{className:`li`},[`Basic Usage`]),G(`p`,{className:`lj`},[`Wrap any content with the EnterExit component to apply animations. `,`The component automatically handles animation timing and easing.`])]),G(`div`,{className:`ld`},[G(`div`,{className:`le`},[G(`h3`,{className:`lf`},[`Mint Code Example`])]),G(BR,{zq:aao(),zr:`mint`,zs:true})]),G(`div`,{className:`lh`},[G(`h3`,{className:`li`},[`Replay Animations`]),G(`p`,{className:`lj`},[`Use the `,G(`code`,{className:`ln`},[`key`]),` prop to trigger replay. `,`Changing the key value will restart the animation.`])])]):(E(aab.value,`api`)?G(`div`,{},[G(`div`,{className:`lh`},[G(`h3`,{className:`li`},[`Props`]),G(`table`,{className:`lk`},[G(`thead`,{},[G(`tr`,{},[G(`th`,{className:`ll`},[`Property`]),G(`th`,{className:`ll`},[`Description`]),G(`th`,{className:`ll`},[`Type`]),G(`th`,{className:`ll`},[`Default`])])]),G(`tbody`,{},[G(`tr`,{},[G(`td`,{className:`lm`},[G(`code`,{className:`ln`},[`animation`])]),G(`td`,{className:`lm`},[`Animation type to apply`]),G(`td`,{className:`lm`},[`String`]),G(`td`,{className:`lm`},[`"fadeIn"`])]),G(`tr`,{},[G(`td`,{className:`lm`},[G(`code`,{className:`ln`},[`duration`])]),G(`td`,{className:`lm`},[`Animation duration in seconds`]),G(`td`,{className:`lm`},[`Number`]),G(`td`,{className:`lm`},[`0.6`])]),G(`tr`,{},[G(`td`,{className:`lm`},[G(`code`,{className:`ln`},[`easing`])]),G(`td`,{className:`lm`},[`CSS timing function`]),G(`td`,{className:`lm`},[`String`]),G(`td`,{className:`lm`},[`"ease-out"`])]),G(`tr`,{},[G(`td`,{className:`lm`},[G(`code`,{className:`ln`},[`delay`])]),G(`td`,{className:`lm`},[`Delay before animation starts (seconds)`]),G(`td`,{className:`lm`},[`Number`]),G(`td`,{className:`lm`},[`0`])]),G(`tr`,{},[G(`td`,{className:`lm`},[G(`code`,{className:`ln`},[`content`])]),G(`td`,{className:`lm`},[`Content to animate`]),G(`td`,{className:`lm`},[`Html`]),G(`td`,{className:`lm`},[`Html.empty()`])])])])]),G(`div`,{className:`lh`},[G(`h3`,{className:`li`},[`Easing Functions`]),G(`p`,{className:`lj`},[`Supported timing functions: `,G(`code`,{className:`ln`},[`ease-out`]),`, `,G(`code`,{className:`ln`},[`ease-in`]),`, `,G(`code`,{className:`ln`},[`ease-in-out`]),`, `,G(`code`,{className:`ln`},[`linear`]),`, or any valid CSS cubic-bezier.`])])]):G(`div`,{},[G(`div`,{className:`lh`},[G(`h3`,{className:`li`},[`Available Animations`]),G(`p`,{className:`lj`},[`Choose from 8 pre-built enter/exit animations.`])]),G(`table`,{className:`lk`},[G(`thead`,{},[G(`tr`,{},[G(`th`,{className:`ll`},[`Animation`]),G(`th`,{className:`ll`},[`Description`]),G(`th`,{className:`ll`},[`Transform`])])]),G(`tbody`,{},[(()=>{const _0=[];const _1=aac();let _i=-1;for(let abe of _1){_i++;_0.push(G(`tr`,{},[G(`td`,{className:`lm`},[G(`code`,{className:`ln`},[abe.id])]),G(`td`,{className:`lm`},[abe.label]),G(`td`,{className:`lm`},[abe.code])]))};return _0})()])]),G(`div`,{className:`ld`},[G(`div`,{className:`le`},[G(`h3`,{className:`lf`},[`CSS @keyframes for `,G(`code`,{className:`ln`},[zw.value])])]),G(BR,{zq:aap(),zr:`css`,zs:true})])]))))])},abf=(abg)=>{return (abg.replace(/\b[a-z]/g, char => char.toUpperCase()))},BT=()=>{const abh=()=>{return M(ak.value,[[`introduction`,()=>{return G(BB,{})}],[`home`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`Introduction`]),G(`p`,{className:`jl`},[`Welcome to the Mint UI Component Library. `,`This is a comprehensive collection of reusable components.`]),G(`h2`,{className:`jk`},[`Getting Started`]),G(`p`,{className:`jl`},[`Browse through the sidebar to explore different components.`])])}],[`quickstart`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`Quickstart Guide`]),G(`p`,{className:`jl`},[`Get started quickly with our component library.`]),G(`div`,{className:`jm`},[`mint install my-component`])])}],[`advanced-usage`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`Advanced Usage`]),G(`p`,{className:`jl`},[`Learn advanced techniques and patterns.`]),G(`h2`,{className:`jk`},[`Custom Styling`]),G(`p`,{className:`jl`},[`You can customize components using CSS variables.`])])}],[`button`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`Button Component`]),G(`p`,{className:`jl`},[`Buttons allow users to take actions with a single tap.`]),G(`h2`,{className:`jk`},[`Basic Usage`]),G(`div`,{className:`jm`},[`<button>Click me</button>`])])}],[`calendar`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`Calendar Component`]),G(`p`,{className:`jl`},[`Calendar component for date selection.`])])}],[`badge`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`Badge Component`]),G(`p`,{className:`jl`},[`Badge is used to display notification counts or status.`])])}],[`codes`,()=>{return G(BE,{})}],[`themes`,()=>{return G(BG,{})}],[`video-player`,()=>{return G(BJ,{})}],[`matrix`,()=>{return G(BL,{})}],[`tabs`,()=>{return G(BN,{})}],[`address-edit`,()=>{return G(BP,{})}],[`enter-exit`,()=>{return G(BS,{})}],[`gestures`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`Gestures Animations`]),G(`p`,{className:`jl`},[`Interactive gesture-based animations. Content coming soon...`])])}],[`scroll`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`Scroll Animations`]),G(`p`,{className:`jl`},[`Scroll-triggered reveal animations. Content coming soon...`])])}],[`keyframes`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`Keyframes`]),G(`p`,{className:`jl`},[`Complex animation sequences. Content coming soon...`])])}],[`transforms`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`Transforms`]),G(`p`,{className:`jl`},[`Rotation, scale, and transform animations. Content coming soon...`])])}],[`spring`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`Spring Physics`]),G(`p`,{className:`jl`},[`Physics-based spring animations. Content coming soon...`])])}],[`orchestration`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`Orchestration`]),G(`p`,{className:`jl`},[`Stagger and sequence animations. Content coming soon...`])])}],[`not-found`,()=>{return G(J,{},[G(`h1`,{className:`jj`},[`404 - Page Not Found`]),G(`p`,{className:`jl`},[`The page you are looking for does not exist.`])])}],[null,()=>{return G(J,{},[G(`h1`,{className:`jj`},[abf(ak.value)]),G(`p`,{className:`jl`},[`This is the `,ak.value,` page. Content coming soon...`]),G(`p`,{className:`jl`},[`Section: `,an.value])])}]])};return G(`div`,{className:`ji`},[abh()])},abi=G(`svg`,{dangerouslySetInnerHTML:{__html:`<path d="M35 0v.351h.185c.17 0 .329.071.475.212.147.118.271.27.37.457.098.19.172.391.22.599.049.21.073.398.073.562v19.53c0 .186-.024.399-.074.633a2.52 2.52 0 0 1-.22.598c-.094.183-.22.35-.369.494a.675.675 0 0 1-.475.21H35v.353h4.005v-.354h-.184a.717.717 0 0 1-.514-.209 2.799 2.799 0 0 1-.405-.494 2.51 2.51 0 0 1-.22-.598 3.136 3.136 0 0 1-.074-.634V3.518l9.002 20.48L56.09 2.43V21.71c0 .187-.024.4-.074.634a1.85 1.85 0 0 1-.256.598c-.097.187-.219.353-.365.494a.68.68 0 0 1-.48.21h-.183v.353h5.216v-.354h-.183a.723.723 0 0 1-.515-.209 2.79 2.79 0 0 1-.403-.494 2.51 2.51 0 0 1-.22-.598 3.135 3.135 0 0 1-.074-.634V2.181c0-.164.025-.352.074-.563a2.52 2.52 0 0 1 .22-.598c.123-.187.256-.34.403-.457a.723.723 0 0 1 .516-.212h.183V0h-4.152l-8.524 19.25L38.747 0zm60.884 2.181L92.21 3.306v.354c.613.024.967.21 1.066.563.121.329.185.69.185 1.09v3.132h-2.058v1.197h2.057v8.76c0 .68.01 1.348.036 2.007a5.88 5.88 0 0 0 .404 1.794c.22.54.576.972 1.066 1.301.49.329 1.177.494 2.058.494.711 0 1.236-.094 1.58-.282.367-.187.65-.364.844-.529a.767.767 0 0 1 .552-.211v-2.568h-.331a3.168 3.168 0 0 1-.88 1.689c-.442.47-.92.704-1.435.704-.343 0-.611-.082-.807-.246-.196-.187-.343-.446-.44-.775a5.305 5.305 0 0 1-.186-1.232 33.518 33.518 0 0 1-.037-1.654V9.642H100V8.446h-4.116zm-29.945.775c-.49 0-.907.165-1.25.494a1.651 1.651 0 0 0-.478 1.195c0 .47.16.857.478 1.162.343.305.76.458 1.249.458.49 0 .908-.153 1.25-.458.343-.305.514-.693.514-1.162 0-.47-.17-.867-.514-1.195a1.741 1.741 0 0 0-1.249-.494zm1.69 5.067L63.952 9.15v.316c.59.024.946.225 1.069.6.122.352.183.728.183 1.126v10.518c0 .187-.026.4-.074.634a2.48 2.48 0 0 1-.22.598c-.098.187-.22.354-.367.494a.717.717 0 0 1-.514.21V24h4.776v-.354a.722.722 0 0 1-.516-.209 1.887 1.887 0 0 1-.366-.494 2.51 2.51 0 0 1-.22-.598 3.136 3.136 0 0 1-.074-.634zm8.745.036-3.675 1.127v.317c.588.023.943.222 1.065.598.122.351.185.727.185 1.126V21.71c0 .187-.024.4-.074.634-.05.212-.137.415-.258.598-.097.187-.22.353-.365.494a.68.68 0 0 1-.48.21v.353h4.778v-.354a.717.717 0 0 1-.514-.209 4.506 4.506 0 0 1-.368-.494c-.099-.19-.173-.39-.221-.598a3.135 3.135 0 0 1-.074-.634v-8.583c0-.492.123-.963.37-1.409.268-.469.598-.865.99-1.195a5.285 5.285 0 0 1 1.397-.846 4.404 4.404 0 0 1 1.617-.316c.538 0 1.064.105 1.58.317a3.694 3.694 0 0 1 1.433.915c.417.422.747.95.992 1.583s.367 1.372.367 2.218v7.316c0 .187-.024.4-.074.634-.05.212-.137.414-.258.598-.097.187-.22.353-.366.494a.68.68 0 0 1-.48.21v.353h4.742v-.354a.722.722 0 0 1-.515-.21 4.506 4.506 0 0 1-.368-.493 2.51 2.51 0 0 1-.22-.598 3.135 3.135 0 0 1-.073-.634v-7.562c0-.681-.122-1.374-.367-2.077a5.284 5.284 0 0 0-1.103-1.97c-.515-.61-1.175-1.102-1.983-1.478-.809-.376-1.789-.564-2.94-.564-.686 0-1.287.071-1.801.212-.49.118-.932.281-1.324.492a4.7 4.7 0 0 0-.954.634 5.485 5.485 0 0 0-.662.598z"/>
    <path d="M25.17.004a4.599 4.599 0 0 0-1.394.597.48.48 0 0 0-.596-.435 6.74 6.74 0 0 0-1.905.823.48.48 0 0 0-.624-.34 7.053 7.053 0 0 0-2.401 1.489.515.515 0 0 0-.244-.323.478.478 0 0 0-.431-.015c-.46.209-1.574.826-2.709 2.29l.021.01c-1.285 1.314-2.407 2.785-3.159 4.85a.543.543 0 0 1-.436.365.47.47 0 0 1-.457-.21 3.648 3.648 0 0 0-.283-.376c-1.325 2.659-1.163 8.536.036 11.255 1.146 2.69 1.418 3.715 1.462 3.931.222-.722.604-1.954.683-2.216a52.335 52.334 0 0 1 1.28-3.709c-.999-1.844-1.144-4.452-.53-6.855.186-.729 1.086-.566.903.142-.474 1.84-.456 3.86.142 5.432a52.362 52.36 0 0 1 2.72-5.563 10.452 10.452 0 0 1 .138-3.5 3.682 3.682 0 0 1 .453-1.198c.416-.613 1.142-.08.736.518-.012.02-.015.02-.014.016l-.036.085a4.231 4.231 0 0 0-.214.658 7.92 7.92 0 0 0-.195 1.94 51.87 51.87 0 0 1 4.547-6.344c.462-.545 1.13.06.68.59a50.105 50.104 0 0 0-4.473 6.245 10.607 10.606 0 0 0 1.631-.94 4.526 4.526 0 0 0 .497-.415c.036-.035.056-.052.066-.06-.005.002-.005.001.008-.018.316-.603 1.176-.001.736.514a3.527 3.527 0 0 1-.86.793 15.98 15.98 0 0 1-2.934 1.58 51.404 51.402 0 0 0-2.664 5.456c1.52-.627 2.966-1.772 4.122-2.998.427-.49 1.121.224.635.654-1.46 1.55-3.307 2.968-5.264 3.608-.49 1.266-1.397 4.487-1.727 5.67.547-.61 1.898-1.779 5.155-3.097 4.125-1.57 5.65-4.046 6.119-5.046a.518.518 0 0 0-.208-.658A2.135 2.135 0 0 0 23.68 15a15.548 15.548 0 0 0 1.847-3.279.529.529 0 0 0-.004-.399.481.481 0 0 0-.273-.261 2.5 2.5 0 0 0-.478-.125 7.102 7.102 0 0 0 .914-2.782.502.502 0 0 0-.127-.377.488.488 0 0 0-.351-.164h-.021a7.68 7.68 0 0 0 .721-2.388.496.496 0 0 0-.436-.556 8.274 8.274 0 0 0 .502-1.878.509.509 0 0 0-.127-.407.478.478 0 0 0-.353-.162A5.486 5.486 0 0 0 25.99.815a.92.92 0 0 0-.087-.55c-.142-.316-.63-.262-.732-.26zM2.686.288c-.012 0-.02.003-.032.004a.587.587 0 0 0-.045.004c-.021.004-.044.006-.065.013a.313.313 0 0 0-.026.01c-.003 0-.003.002-.006.003a.49.49 0 0 0-.065.033c-.01.005-.021.009-.03.015a.488.488 0 0 0-.214.436A4.52 4.52 0 0 0 .745.412a1.02 1.02 0 0 1-.062.006l-.095.01L.526.44l-.04.009a1.13 1.13 0 0 0-.108.03C.357.485.338.495.317.504.303.51.287.514.273.522.252.532.235.545.215.559L.18.585C.16.602.14.617.124.637.116.645.111.658.104.667L.098.675a.375.375 0 0 0-.05.098.92.92 0 0 0-.011.556A5.518 5.518 0 0 0 .719 2.65a.484.484 0 0 0-.326.21.521.521 0 0 0-.07.422 8.376 8.376 0 0 0 .748 1.793.46.46 0 0 0-.27.18.494.494 0 0 0-.086.433 7.61 7.61 0 0 0 1.039 2.264h-.023a.496.496 0 0 0-.326.209.52.52 0 0 0-.076.394 7.06 7.06 0 0 0 1.28 2.628 2.454 2.454 0 0 0-.457.19.482.482 0 0 0-.235.294.534.534 0 0 0 .05.397 15.486 15.486 0 0 0 2.271 2.992 2.264 2.264 0 0 0-.476.27.513.513 0 0 0-.116.675c.03.047.064.099.101.153.04.057.084.115.131.178l.008.01a8.185 8.184 0 0 0 1.317 1.375l.02.017a9.299 9.298 0 0 0 .324.26c.051.038.103.073.155.11.07.052.142.102.216.153l.203.135c.064.042.124.085.19.126.076.048.155.094.233.14l.188.111c.086.048.175.095.263.142l.188.098c.096.048.196.095.294.141.063.03.12.06.184.09.112.05.227.098.341.146.043.018.083.038.127.056l.004.002.036.013c.093.037.879.262 1.542.41-.49-1.136-.8-2.63-.924-4.212a18.741 18.741 0 0 1-1.543-1.192c-.568-.406.105-1.247.616-.77.278.24.576.471.876.698a18.048 18.048 0 0 1 .284-3.547 17.257 17.257 0 0 1-3.166-1.317 3.753 3.753 0 0 1-1.007-.751c-.528-.505.335-1.248.738-.637.017.02.014.023.009.02.011.008.035.025.078.059a4.876 4.876 0 0 0 .58.39 11.42 11.42 0 0 0 1.855.828A53.467 53.466 0 0 0 4.855 5.52a54.048 54.047 0 0 0-2.213-2.285c-.54-.52.117-1.242.67-.709A55.397 55.396 0 0 1 8.87 8.824a8.46 8.46 0 0 0-.41-2.057 4.48 4.48 0 0 0-.297-.68l-.048-.09c0 .005-.001.007-.017-.013-.499-.596.227-1.247.738-.636a3.935 3.935 0 0 1 .614 1.236c.17.538.29 1.09.376 1.647.063-.13.125-.262.193-.381a.537.537 0 0 1 .303-.236.461.461 0 0 1 .361.042 1.9 1.9 0 0 1 .438.36c.651-1.54 1.555-3.081 2.664-4.326-.424-.511-1.31-1.196-1.343-1.223-.01-.008-.022-.01-.032-.017a.51.51 0 0 0-.385-.09.484.484 0 0 0-.326.236 2.509 2.509 0 0 0-.184.431l-.049-.043a9.845 9.845 0 0 0-.355-.325l-.053-.05a8.856 8.856 0 0 0-.396-.32L10.6 2.24a8.464 8.464 0 0 0-.406-.292l-.05-.03a7.403 7.403 0 0 0-.585-.347c-.018-.01-.034-.022-.051-.03l-.074-.038c-.037-.019-.072-.035-.108-.052l-.047-.022c-.042-.02-.084-.043-.124-.06l-.036-.016c-.041-.018-.08-.037-.119-.052l-.036-.013c-.036-.015-.074-.028-.11-.042l-.042-.015c-.029-.01-.062-.025-.09-.035l-.071-.026-.04-.011-.102-.033a.537.537 0 0 0-.127-.02h-.01c-.01.001-.02.005-.03.005-.027 0-.056 0-.082.006a.461.461 0 0 0-.178.083.516.516 0 0 0-.199.35A6.995 6.994 0 0 0 5.308.416H5.3A.477.477 0 0 0 5.192.41c-.016 0-.033.004-.049.006a.473.473 0 0 0-.408.427A6.735 6.735 0 0 0 2.739.29L2.735.286c-.017-.002-.034 0-.05 0z"/>`},viewBox:`0 0 100 24`,height:`24`,width:`100`}),abj=(abk)=>{return (abk.getUTCFullYear())},abl=()=>{return (new Date())},BU=()=>{H(()=>{(()=>{return ac()})()},[]);return G(`div`,{className:`ho`},[G(AZ,{}),G(`div`,{className:`hp`},[G(BA,{bp:true}),G(`div`,{className:`hq`},[G(`div`,{className:`hr`},[G(BT,{}),G(`div`,{className:`hs`},[abi,G(`small`,{},[`2018 - ${abj(abl())}`])])])])])])};export default ()=>{R(BU,{},V,[{await:false,path:`/`,decoders:[],mapping:[],handler:()=>{return aq(`introduction`,`Essentials`)}},{await:false,path:`/introduction`,decoders:[],mapping:[],handler:()=>{return aq(`introduction`,`Essentials`)}},{await:false,path:`/home`,decoders:[],mapping:[],handler:()=>{return aq(`home`,`Essentials`)}},{await:false,path:`/quickstart`,decoders:[],mapping:[],handler:()=>{return aq(`quickstart`,`Essentials`)}},{await:false,path:`/themes`,decoders:[],mapping:[],handler:()=>{return aq(`themes`,`Essentials`)}},{await:false,path:`/advanced-usage`,decoders:[],mapping:[],handler:()=>{return aq(`advanced-usage`,`Essentials`)}},{await:false,path:`/faq`,decoders:[],mapping:[],handler:()=>{return aq(`faq`,`Essentials`)}},{await:false,path:`/changelog`,decoders:[],mapping:[],handler:()=>{return aq(`changelog`,`Essentials`)}},{await:false,path:`/button`,decoders:[],mapping:[],handler:()=>{return aq(`button`,`Basic Components`)}},{await:false,path:`/cell`,decoders:[],mapping:[],handler:()=>{return aq(`cell`,`Basic Components`)}},{await:false,path:`/icon`,decoders:[],mapping:[],handler:()=>{return aq(`icon`,`Basic Components`)}},{await:false,path:`/image`,decoders:[],mapping:[],handler:()=>{return aq(`image`,`Basic Components`)}},{await:false,path:`/layout`,decoders:[],mapping:[],handler:()=>{return aq(`layout`,`Basic Components`)}},{await:false,path:`/calendar`,decoders:[],mapping:[],handler:()=>{return aq(`calendar`,`Form Components`)}},{await:false,path:`/checkbox`,decoders:[],mapping:[],handler:()=>{return aq(`checkbox`,`Form Components`)}},{await:false,path:`/date-picker`,decoders:[],mapping:[],handler:()=>{return aq(`date-picker`,`Form Components`)}},{await:false,path:`/field`,decoders:[],mapping:[],handler:()=>{return aq(`field`,`Form Components`)}},{await:false,path:`/form`,decoders:[],mapping:[],handler:()=>{return aq(`form`,`Form Components`)}},{await:false,path:`/badge`,decoders:[],mapping:[],handler:()=>{return aq(`badge`,`Display Components`)}},{await:false,path:`/circle`,decoders:[],mapping:[],handler:()=>{return aq(`circle`,`Display Components`)}},{await:false,path:`/collapse`,decoders:[],mapping:[],handler:()=>{return aq(`collapse`,`Display Components`)}},{await:false,path:`/countdown`,decoders:[],mapping:[],handler:()=>{return aq(`countdown`,`Display Components`)}},{await:false,path:`/video-player`,decoders:[],mapping:[],handler:()=>{return aq(`video-player`,`Display Components`)}},{await:false,path:`/matrix`,decoders:[],mapping:[],handler:()=>{return aq(`matrix`,`Display Components`)}},{await:false,path:`/tabs`,decoders:[],mapping:[],handler:()=>{return aq(`tabs`,`Navigation Components`)}},{await:false,path:`/address-edit`,decoders:[],mapping:[],handler:()=>{return aq(`address-edit`,`Business Components`)}},{await:false,path:`/codes`,decoders:[],mapping:[],handler:()=>{return aq(`codes`,`Tools`)}},{await:false,path:`/qr-code`,decoders:[],mapping:[],handler:()=>{return aq(`codes`,`Tools`)}},{await:false,path:`/barcode`,decoders:[],mapping:[],handler:()=>{return aq(`codes`,`Tools`)}},{await:false,path:`/animations/enter-exit`,decoders:[],mapping:[],handler:()=>{return aq(`enter-exit`,`Wū Animations`)}},{await:false,path:`/animations/gestures`,decoders:[],mapping:[],handler:()=>{return aq(`gestures`,`Wū Animations`)}},{await:false,path:`/animations/scroll`,decoders:[],mapping:[],handler:()=>{return aq(`scroll`,`Wū Animations`)}},{await:false,path:`/animations/keyframes`,decoders:[],mapping:[],handler:()=>{return aq(`keyframes`,`Wū Animations`)}},{await:false,path:`/animations/transforms`,decoders:[],mapping:[],handler:()=>{return aq(`transforms`,`Wū Animations`)}},{await:false,path:`/animations/spring`,decoders:[],mapping:[],handler:()=>{return aq(`spring`,`Wū Animations`)}},{await:false,path:`/animations/orchestration`,decoders:[],mapping:[],handler:()=>{return aq(`orchestration`,`Wū Animations`)}},{await:false,path:`*`,decoders:[],mapping:[],handler:()=>{return aq(`not-found`,``)}}],false)};