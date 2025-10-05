import {patternVariable as O,bracketAccess as Q,createElement as F,useDidUpdate as I,newVariant as P,useEffect as H,useSignal as G,fragment as J,program as R,pattern as N,compare as E,variant as A,signal as C,record as B,match as M,style as K,batch as D,or as L} from "./runtime.js";export const S=A(1,`Maybe.Just`),T=A(0,`Maybe.Nothing`),U=A(1,`Result.Err`),V=A(1,`Result.Ok`),a=B(`CodeExample`),b=B(`SidebarItem`),c=B(`SidebarCategory`),d=B(`CaptionTrack`),e=B(`VideoQuality`),f=B(`PlatformInfo`),g=B(`PlaylistItem`),h=B(`AddressEditInfo`),i=B(`AddressEditSearchItem`),j=B(`TabItem`),k=B(`TabChangeEvent`),l=B(`TabClickEvent`),m=B(`TabScrollEvent`),n=B(`MatrixCell`),o=B(`MatrixData`),p=B(`AnimationItem`),q=B(`ApiProperty`),r=B(`CodeSnippet`),s=B(`UsageExample`),W=A(1,`Http.ResponseBody.FormData`),X=A(1,`Http.ResponseBody.JSON`),Y=A(1,`Http.ResponseBody.HTML`),Z=A(1,`Http.ResponseBody.Text`),AA=A(1,`Http.ResponseBody.XML`),AB=A(1,`Http.ResponseBody.File`),AC=A(0,`Http.Error.NetworkError`),AD=A(0,`Http.Error.Aborted`),AE=A(0,`Http.Error.Timeout`),AF=A(0,`Http.Error.BadUrl`),AG=A(0,`Month.January`),AH=A(0,`Month.February`),AI=A(0,`Month.March`),AJ=A(0,`Month.April`),AK=A(0,`Month.May`),AL=A(0,`Month.June`),AM=A(0,`Month.July`),AN=A(0,`Month.August`),AO=A(0,`Month.September`),AP=A(0,`Month.October`),AQ=A(0,`Month.November`),AR=A(0,`Month.December`),AS=A(0,`Weekday.Monday`),AT=A(0,`Weekday.Tuesday`),AU=A(0,`Weekday.Wednesday`),AV=A(0,`Weekday.Thursday`),AW=A(0,`Weekday.Friday`),AX=A(0,`Weekday.Saturday`),AY=A(0,`Weekday.Sunday`),t=C(`default`),u=(v)=>{return (Promise.resolve(v))},w=(x)=>{((() => {
      const root = document.documentElement;

      switch(x) {
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
    })());return u(null)},y=(z)=>{(()=>{t.value=z})();return w(z)},aa=C(`#1989fa`),ab=(ac)=>{((() => {
      document.documentElement.style.setProperty('--primary-color', ac);
    })());return u(null)},ad=(ae)=>{(()=>{aa.value=ae})();return ab(ae)},af=()=>{w(t.value);return ab(aa.value)},ag=()=>{D(()=>{t.value=`default`;aa.value=`#1989fa`});return af()},ah=C(`desktop`),ai=(aj)=>{return (()=>{ah.value=aj})()},ak=()=>{return (E(ah.value,`desktop`)?(()=>{ah.value=`mobile`})():(()=>{ah.value=`desktop`})())},al=()=>{return E(ah.value,`mobile`)},am=()=>{return E(ah.value,`desktop`)},an=C(`home`),ao=(ap)=>{return (()=>{an.value=ap})()},aq=C(`Essentials`),ar=(as)=>{return (()=>{aq.value=as})()},at=(au,av)=>{return D(()=>{an.value=au;aq.value=av})},aw=C(false),ax=()=>{return (()=>{aw.value=!aw.value})()},ay=()=>{return (()=>{aw.value=false})()},AZ=()=>{const az=()=>{return (E(t.value,`dark`)?y(`default`):y(`dark`))},ba=()=>{return ak()},bb=()=>{return ax()};return F(`div`,{className:`kx`},[F(`div`,{className:`ky`},[F(`div`,{className:`kz`},[F(`button`,{"onClick":bb,className:`ln`},[F(`span`,{className:(aw.value?`hamburgerLine1Open`:``) + ` lo`}),F(`span`,{className:(aw.value?`hamburgerLine2Open`:``) + ` lo`}),F(`span`,{className:(aw.value?`hamburgerLine3Open`:``) + ` lo`})]),F(`a`,{"href":`/`,className:`la`},[F(`img`,{"src":`https://fastly.jsdelivr.net/npm/@vant/assets/logo.png`,className:`lb`}),F(`span`,{className:`lc`},[`Mint Wū`]),F(`span`,{className:`ld`},[`(Mint Lang 0.28.0)`])]),F(`ul`,{className:`le`},[F(`li`,{className:`hideOnMobile` + ` lf`},[F(`div`,{"onClick":ba,className:(E(ah.value,`mobile`)?`viewModeActive`:``) + ` lk`},[(E(ah.value,`mobile`)?F(`svg`,{"viewBox":`0 0 24 24`,"fill":`currentColor`,className:`viewModeIcon` + ` ll`},[F(`path`,{"d":`M17 1.01L7 1c-1.1 0-2 .9-2 2v18c0 1.1.9 2 2 2h10c1.1 0 2-.9 2-2V3c0-1.1-.9-1.99-2-1.99zM17 19H7V5h10v14z`})]):F(`svg`,{"viewBox":`0 0 24 24`,"fill":`currentColor`,className:`viewModeIcon` + ` ll`},[F(`path`,{"d":`M21 2H3c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h7v2H8v2h8v-2h-2v-2h7c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 14H3V4h18v12z`})])),F(`span`,{className:`viewModeText` + ` lm`},[(E(ah.value,`mobile`)?`📱 Mobile`:`🖥️ Desktop`)])])]),F(`li`,{className:`hideOnMobile` + ` lf`},[F(`a`,{"target":`_blank`,"href":`https://github.com/mint-lang/mint`,className:`lg`},[F(`img`,{"src":`https://fastly.jsdelivr.net/npm/@vant/assets/github.svg`,className:`lh`})])]),F(`li`,{className:`lf`},[F(`a`,{"onClick":az,className:`lg`},[F(`img`,{"src":`https://b.yzcdn.cn/vant/dark-theme.svg`,className:`lh`})])]),F(`li`,{className:`hideOnMobile` + ` lf`},[F(`span`,{className:`li lj`},[`v0.28.0`])]),F(`li`,{className:`hideOnMobile` + ` lf`},[F(`a`,{"href":`https://mint-lang.com`,"target":`_blank`,className:`li`},[`Docs`])])])])])])},bc=()=>{return ([])},bd=()=>{return [c({id:`essentials`,title:`Essentials`,icon:`📚`,items:[b({id:`introduction`,label:`Introduction`,route:`/introduction`,subtitle:``,badge:``}),b({id:`quickstart`,label:`Quickstart`,route:`/quickstart`,subtitle:``,badge:``}),b({id:`themes`,label:`Themes`,route:`/themes`,subtitle:``,badge:`NEW`}),b({id:`advanced`,label:`Advanced Usage`,route:`/advanced`,subtitle:``,badge:``}),b({id:`faq`,label:`FAQ`,route:`/faq`,subtitle:``,badge:``}),b({id:`changelog`,label:`Changelog`,route:`/changelog`,subtitle:``,badge:``}),b({id:`contribution`,label:`Contribution Guide`,route:`/contribution`,subtitle:``,badge:``})]}),c({id:`basic`,title:`Basic Components`,icon:`🧩`,items:[b({id:`avatar`,label:`Avatar`,route:`/avatar`,subtitle:``,badge:``}),b({id:`button`,label:`Button`,route:`/button`,subtitle:``,badge:``}),b({id:`cell`,label:`Cell`,route:`/cell`,subtitle:``,badge:``}),b({id:`icon`,label:`Icon`,route:`/icon`,subtitle:``,badge:``}),b({id:`image`,label:`Image`,route:`/image`,subtitle:``,badge:``}),b({id:`layout`,label:`Layout`,route:`/layout`,subtitle:``,badge:``}),b({id:`popup`,label:`Popup`,route:`/popup`,subtitle:``,badge:``}),b({id:`space`,label:`Space`,route:`/space`,subtitle:``,badge:``}),b({id:`toast`,label:`Toast`,route:`/toast`,subtitle:``,badge:``})]}),c({id:`form`,title:`Form Components`,icon:`📝`,items:[b({id:`calendar`,label:`Calendar`,route:`/calendar`,subtitle:``,badge:``}),b({id:`cascader`,label:`Cascader`,route:`/cascader`,subtitle:``,badge:``}),b({id:`checkbox`,label:`Checkbox`,route:`/checkbox`,subtitle:``,badge:``}),b({id:`datepicker`,label:`DatePicker`,route:`/datepicker`,subtitle:``,badge:``}),b({id:`field`,label:`Field`,route:`/field`,subtitle:`Input`,badge:``}),b({id:`form`,label:`Form`,route:`/form`,subtitle:``,badge:``}),b({id:`number-keyboard`,label:`NumberKeyboard`,route:`/number-keyboard`,subtitle:``,badge:``}),b({id:`password-input`,label:`PasswordInput`,route:`/password-input`,subtitle:``,badge:``}),b({id:`picker`,label:`Picker`,route:`/picker`,subtitle:``,badge:``}),b({id:`radio`,label:`Radio`,route:`/radio`,subtitle:``,badge:``}),b({id:`rate`,label:`Rate`,route:`/rate`,subtitle:``,badge:``}),b({id:`search`,label:`Search`,route:`/search`,subtitle:``,badge:``}),b({id:`slider`,label:`Slider`,route:`/slider`,subtitle:``,badge:``}),b({id:`stepper`,label:`Stepper`,route:`/stepper`,subtitle:``,badge:``}),b({id:`switch`,label:`Switch`,route:`/switch`,subtitle:``,badge:``}),b({id:`timepicker`,label:`TimePicker`,route:`/timepicker`,subtitle:``,badge:``}),b({id:`uploader`,label:`Uploader`,route:`/uploader`,subtitle:``,badge:``})]}),c({id:`action`,title:`Action Components`,icon:`⚡`,items:[b({id:`action-sheet`,label:`ActionSheet`,route:`/action-sheet`,subtitle:``,badge:``}),b({id:`dialog`,label:`Dialog`,route:`/dialog`,subtitle:``,badge:``}),b({id:`dropdown-menu`,label:`DropdownMenu`,route:`/dropdown-menu`,subtitle:``,badge:``}),b({id:`loading`,label:`Loading`,route:`/loading`,subtitle:``,badge:``}),b({id:`notify`,label:`Notify`,route:`/notify`,subtitle:``,badge:``}),b({id:`overlay`,label:`Overlay`,route:`/overlay`,subtitle:``,badge:``}),b({id:`pull-refresh`,label:`PullRefresh`,route:`/pull-refresh`,subtitle:``,badge:``}),b({id:`share-sheet`,label:`ShareSheet`,route:`/share-sheet`,subtitle:``,badge:``}),b({id:`swipe-cell`,label:`SwipeCell`,route:`/swipe-cell`,subtitle:``,badge:``})]}),c({id:`display`,title:`Display Components`,icon:`🎨`,items:[b({id:`badge`,label:`Badge`,route:`/badge`,subtitle:``,badge:``}),b({id:`circle`,label:`Circle`,route:`/circle`,subtitle:`Progress`,badge:``}),b({id:`collapse`,label:`Collapse`,route:`/collapse`,subtitle:``,badge:``}),b({id:`countdown`,label:`CountDown`,route:`/countdown`,subtitle:``,badge:``}),b({id:`divider`,label:`Divider`,route:`/divider`,subtitle:``,badge:``}),b({id:`empty`,label:`Empty`,route:`/empty`,subtitle:``,badge:``}),b({id:`image-preview`,label:`ImagePreview`,route:`/image-preview`,subtitle:``,badge:``}),b({id:`lazyload`,label:`Lazyload`,route:`/lazyload`,subtitle:``,badge:``}),b({id:`list`,label:`List`,route:`/list`,subtitle:``,badge:``}),b({id:`notice-bar`,label:`NoticeBar`,route:`/notice-bar`,subtitle:``,badge:``}),b({id:`popover`,label:`Popover`,route:`/popover`,subtitle:``,badge:``}),b({id:`progress`,label:`Progress`,route:`/progress`,subtitle:``,badge:``}),b({id:`skeleton`,label:`Skeleton`,route:`/skeleton`,subtitle:``,badge:``}),b({id:`steps`,label:`Steps`,route:`/steps`,subtitle:``,badge:``}),b({id:`sticky`,label:`Sticky`,route:`/sticky`,subtitle:``,badge:``}),b({id:`swipe`,label:`Swipe`,route:`/swipe`,subtitle:``,badge:``}),b({id:`tag`,label:`Tag`,route:`/tag`,subtitle:``,badge:``}),b({id:`text-ellipsis`,label:`TextEllipsis`,route:`/text-ellipsis`,subtitle:``,badge:``}),b({id:`video-player`,label:`VideoPlayer`,route:`/video-player`,subtitle:``,badge:``}),b({id:`watermark`,label:`Watermark`,route:`/watermark`,subtitle:``,badge:`NEW`}),b({id:`matrix`,label:`Matrix`,route:`/matrix`,subtitle:`Grid Layout`,badge:`NEW`})]}),c({id:`navigation`,title:`Navigation Components`,icon:`🧭`,items:[b({id:`action-bar`,label:`ActionBar`,route:`/action-bar`,subtitle:``,badge:``}),b({id:`back-top`,label:`BackTop`,route:`/back-top`,subtitle:``,badge:``}),b({id:`grid`,label:`Grid`,route:`/grid`,subtitle:``,badge:``}),b({id:`index-bar`,label:`IndexBar`,route:`/index-bar`,subtitle:``,badge:``}),b({id:`navbar`,label:`NavBar`,route:`/navbar`,subtitle:``,badge:``}),b({id:`pagination`,label:`Pagination`,route:`/pagination`,subtitle:``,badge:``}),b({id:`sidebar`,label:`Sidebar`,route:`/sidebar`,subtitle:``,badge:``}),b({id:`tabs`,label:`Tabs`,route:`/tabs`,subtitle:``,badge:`NEW`}),b({id:`tabbar`,label:`Tabbar`,route:`/tabbar`,subtitle:``,badge:``}),b({id:`tree-select`,label:`TreeSelect`,route:`/tree-select`,subtitle:``,badge:``})]}),c({id:`business`,title:`Business Components`,icon:`💼`,items:[b({id:`address-edit`,label:`AddressEdit`,route:`/address-edit`,subtitle:``,badge:``}),b({id:`address-list`,label:`AddressList`,route:`/address-list`,subtitle:``,badge:``}),b({id:`area`,label:`Area`,route:`/area`,subtitle:``,badge:``}),b({id:`card`,label:`Card`,route:`/card`,subtitle:``,badge:``}),b({id:`contact-card`,label:`ContactCard`,route:`/contact-card`,subtitle:``,badge:``}),b({id:`coupon`,label:`Coupon`,route:`/coupon`,subtitle:`List`,badge:``}),b({id:`submit-bar`,label:`SubmitBar`,route:`/submit-bar`,subtitle:``,badge:``})]}),c({id:`tools`,title:`Tools`,icon:`🛠️`,items:[b({id:`codes`,label:`QR & Barcodes`,route:`/codes`,subtitle:``,badge:`NEW`})]}),c({id:`animations`,title:`Wū Animations`,icon:`✨`,items:[b({id:`enter-exit`,label:`Enter/Exit`,route:`/animations/enter-exit`,subtitle:`Fade, Slide, Scale`,badge:`NEW`}),b({id:`gestures`,label:`Gestures`,route:`/animations/gestures`,subtitle:`Hover, Tap, Drag`,badge:``}),b({id:`scroll`,label:`Scroll`,route:`/animations/scroll`,subtitle:`Reveal on scroll`,badge:``}),b({id:`keyframes`,label:`Keyframes`,route:`/animations/keyframes`,subtitle:`Sequences`,badge:``}),b({id:`transforms`,label:`Transforms`,route:`/animations/transforms`,subtitle:`Rotate, Scale`,badge:``}),b({id:`spring`,label:`Spring`,route:`/animations/spring`,subtitle:`Physics-based`,badge:``}),b({id:`orchestration`,label:`Orchestration`,route:`/animations/orchestration`,subtitle:`Stagger, Delays`,badge:``})]})]},be=(bf,bg)=>{return ((() => {
      for (let item of bf) {
        if (E(item, bg)) {
          return true
        }
      }

      return false
    })())},bh=(bi,bj)=>{return ((() => {
      const newSet = []

      bi.forEach((item) => {
        if (E(item, bj)) { return }
        newSet.push(item)
      })

      return newSet
    })())},bk=(bl,bm)=>{return (be(bl,bm)?bl:((() => {
        const newSet = Array.from(bl)
        newSet.push(bm)

        return newSet
      })()))},bn=(bo)=>{return E(bo,``)},bp=(bq)=>{return !bn(bq)},BA=({br=true})=>{const bs=G([]),bt=G(bc()),bu=()=>{return ((() => {
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
    })())},bv=(bw)=>{return (be(bt.value,bw)?(()=>{bt.value=bh(bt.value,bw)})():(()=>{bt.value=bk(bt.value,bw)})())},bx=(by)=>{return be(bt.value,by)},bz=()=>{return ay()},ca=(cb)=>{return E(an.value,cb.id)},cc=(cd)=>{return F(`div`,{"id":`sidebar-item-` + cd.id,"data-route":cd.route,className:`lu`},[F(`a`,{"href":cd.route,"data-item-id":cd.id,"onClick":(ce)=>{return bz()},className:(ca(cd)?`active`:``) + ` lv`},[F(`span`,{},[cd.label,(bp(cd.subtitle)?F(`span`,{className:`lw`},[cd.subtitle]):null)]),(bp(cd.badge)?F(`span`,{className:`lx`},[cd.badge]):null)])])},cf=(cg)=>{return F(`div`,{className:`lq`},[F(`div`,{"onClick":(ch)=>{return bv(cg.id)},className:`lr`},[F(`span`,{className:(bx(cg.id)?`collapsed`:``) + ` ls`},[`▼`]),cg.icon,` `,cg.title]),F(`div`,{className:(bx(cg.id)?`collapsed`:`expanded`) + ` lt`},[(()=>{const _0=[];const _1=cg.items;let _i=-1;for(let ci of _1){_i++;_0.push(cc(ci))};return _0})()])])};H(()=>{(()=>{bu();return (()=>{bs.value=bd()})()})()},[]);I(()=>{bu();return u(null)});return F(J,{},[F(`div`,{"onClick":bz,className:(aw.value?`overlayVisible`:`overlayHidden`) + ` ly`}),F(`div`,{className:`sidebar ` + (br?`fixed`:``) + ` ` + (aw.value?`sidebarOpen`:`sidebarClosed`) + ` lp`},[(()=>{const _0=[];const _1=bs.value;let _i=-1;for(let cj of _1){_i++;_0.push(cf(cj))};return _0})()])])},ck=()=>{return u(null)},BB=()=>{const cl=G(0),cm=G(0),cn=G(0),co=G(false),cp=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--g-a`]:`56px`,[`--g-b`]:`-2px`}):null);return _},cq=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--h-a`]:`20px`,[`--h-b`]:`32px`}):null);return _},cr=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--i-a`]:`18px 48px`,[`--i-b`]:`16px`}):null);return _},cs=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--j-a`]:`100px 20px`}):null);return _},ct=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--k-a`]:`42px`}):null);return _},cu=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--l-a`]:`18px`,[`--l-b`]:`30px`}):null);return _},cv=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--m-a`]:`1fr`,[`--m-b`]:`40px`}):null);return _},cw=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--n-a`]:`100px 20px`}):null);return _},cx=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--o-a`]:`1fr`,[`--o-b`]:`60px`}):null);return _},cy=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--p-a`]:`40px`}):null);return _},cz=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--q-a`]:`80px 20px`}):null);return _},da=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--r-a`]:`repeat(2, 1fr)`,[`--r-b`]:`40px`}):null);return _},db=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--s-a`]:`64px`}):null);return _},dc=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--t-a`]:`100px 20px`}):null);return _},dd=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--u-a`]:`48px`}):null);return _},de=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--v-a`]:`20px`,[`--v-b`]:`60px`}):null);return _};H(()=>{(()=>{((() => {
      // Mouse tracking for interactive effects
      window.addEventListener('mousemove', (e) => {
        D(()=>{cl.value=(e.clientX);cm.value=(e.clientY)})
      });

      // Scroll tracking
      window.addEventListener('scroll', () => {
        (()=>{cn.value=(window.scrollY)})()
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
    })());return ck()})()},[]);return F(`div`,{className:`fo`},[F(`canvas`,{"id":`cursor-trail`,className:`fp`}),F(`section`,{className:`fq`},[F(`div`,{className:`fr`},[F(`div`,{className:`parallax-layer` + ` fs ft`}),F(`div`,{className:`parallax-layer` + ` fs fu`}),F(`div`,{className:`parallax-layer` + ` fs fv`}),F(`div`,{className:`fw`})]),F(`div`,{className:`fx`},[F(`div`,{className:`animate-on-scroll` + ` fy`},[`KINETIC UI`]),F(`h1`,{className:`animate-on-scroll` + ` fz`,style:K([cp()])},[`Mint Wū`]),F(`p`,{className:`animate-on-scroll` + ` ga`,style:K([cq()])},[`Motion-first UI components that bring your interfaces to life. `,`Built for Mint Lang with fluid animations and interactive experiences.`]),F(`div`,{className:`gb`},[F(`button`,{className:`magnetic-btn` + ` gc gd`,style:K([cr()])},[`Start Creating`]),F(`button`,{className:`magnetic-btn` + ` gc ge`,style:K([cr()])},[`View Showcase`])])])]),F(`div`,{className:`gf`,style:K([cs()])},[F(`div`,{className:`animate-on-scroll` + ` gg`},[F(`h2`,{className:`gh`,style:K([ct()])},[`Built for Motion`]),F(`p`,{className:`gi`,style:K([cu()])},[`Every interaction designed to feel natural, responsive, and delightful`])]),F(`div`,{className:`gj`,style:K([cv()])},[F(`div`,{className:`animate-on-scroll` + ` gk`},[F(`span`,{className:`gl`},[`⚡`]),F(`h3`,{className:`gm`},[`Lightning Fast`]),F(`p`,{className:`gn`},[`60fps animations powered by GPU acceleration. Smooth performance even on low-end devices.`])]),F(`div`,{className:`animate-on-scroll` + ` gk`},[F(`span`,{className:`gl`},[`🎨`]),F(`h3`,{className:`gm`},[`Gesture Based`]),F(`p`,{className:`gn`},[`Natural touch interactions with spring physics and momentum scrolling built-in.`])]),F(`div`,{className:`animate-on-scroll` + ` gk`},[F(`span`,{className:`gl`},[`🎯`]),F(`h3`,{className:`gm`},[`Layout Aware`]),F(`p`,{className:`gn`},[`Automatic layout animations when elements resize, reorder, or change position.`])]),F(`div`,{className:`animate-on-scroll` + ` gk`},[F(`span`,{className:`gl`},[`🔮`]),F(`h3`,{className:`gm`},[`Scroll Magic`]),F(`p`,{className:`gn`},[`Parallax, reveal, and scroll-driven animations with precise control and easing.`])]),F(`div`,{className:`animate-on-scroll` + ` gk`},[F(`span`,{className:`gl`},[`✨`]),F(`h3`,{className:`gm`},[`Micro-interactions`]),F(`p`,{className:`gn`},[`Delightful details like magnetic buttons, ripple effects, and hover transformations.`])]),F(`div`,{className:`animate-on-scroll` + ` gk`},[F(`span`,{className:`gl`},[`🚀`]),F(`h3`,{className:`gm`},[`Page Transitions`]),F(`p`,{className:`gn`},[`Seamless route transitions with shared element animations and custom easing.`])])])]),F(`div`,{className:`go`,style:K([cw()])},[F(`div`,{className:`gp`,style:K([cx()])},[F(`div`,{className:`animate-on-scroll` + ` gq`},[F(`h2`,{className:`gr`,style:K([cy()])},[`Interactive By Default`]),F(`p`,{className:`gs`},[`Every component responds to your cursor, touch, and scroll. `,`Built with spring physics for natural motion that feels alive.`]),F(`button`,{className:`magnetic-btn` + ` gc gd`,style:K([cr()])},[`Explore Components`])]),F(`div`,{className:`animate-on-scroll` + ` gt`},[F(`div`,{style:K([`font-size: 120px;`])},[`🎨`])])])]),F(`div`,{className:`gu`,style:K([cz()])},[F(`div`,{className:`gv`,style:K([da()])},[F(`div`,{className:`animate-on-scroll` + ` gw`},[F(`div`,{className:`gx`,style:K([db()])},[`50+`]),F(`div`,{className:`gy`},[`Components`])]),F(`div`,{className:`animate-on-scroll` + ` gw`},[F(`div`,{className:`gx`,style:K([db()])},[`60fps`]),F(`div`,{className:`gy`},[`Performance`])]),F(`div`,{className:`animate-on-scroll` + ` gw`},[F(`div`,{className:`gx`,style:K([db()])},[`100%`]),F(`div`,{className:`gy`},[`Animated`])]),F(`div`,{className:`animate-on-scroll` + ` gw`},[F(`div`,{className:`gx`,style:K([db()])},[`∞`]),F(`div`,{className:`gy`},[`Possibilities`])])])]),F(`div`,{className:`gz`,style:K([dc()])},[F(`h2`,{className:`animate-on-scroll` + ` ha`,style:K([dd()])},[`Ready to Create Magic?`]),F(`p`,{className:`animate-on-scroll` + ` hb`,style:K([de()])},[`Start building beautiful, animated interfaces today`]),F(`div`,{className:`gb`},[F(`button`,{className:`magnetic-btn` + ` gc gd`,style:K([cr()])},[`Get Started Free`]),F(`button`,{className:`magnetic-btn` + ` gc ge`,style:K([cr()])},[`Browse Documentation`])])])])},df=C(`https://mint-lang.com`),dg=(dh,di)=>{return ((() => {
      const text = dh;
      const errorLevel = di;

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
    })())},dj=C(`M`),dk=C(``),dl=(dm)=>{return ((() => {
      const dataLength = dm.length;
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
    })())},dn=C(0),dp=(dq)=>{return D(()=>{df.value=dq;dk.value=dg(dq,dj.value);dn.value=dl(dq)})},dr=(ds)=>{return D(()=>{dj.value=ds;dk.value=dg(df.value,ds);dn.value=dl(df.value)})},dt=C(`MINT-LANG-2025`),du=[`212222`,`222122`,`222221`,`121223`,`121322`,`131222`,`122213`,`122312`,`132212`,`221213`,`221312`,`231212`,`112232`,`122132`,`122231`,`113222`,`123122`,`123221`,`223211`,`221132`,`221231`,`213212`,`223112`,`312131`,`311222`,`321122`,`321221`,`312212`,`322112`,`322211`,`212123`,`212321`,`232121`,`111323`,`131123`,`131321`,`112313`,`132113`,`132311`,`211313`,`231113`,`231311`,`112133`,`112331`,`132131`,`113123`,`113321`,`133121`,`313121`,`211331`,`231131`,`213113`,`213311`,`213131`,`311123`,`311321`,`331121`,`312113`,`312311`,`332111`,`314111`,`221411`,`431111`,`111224`,`111422`,`121124`,`121421`,`141122`,`141221`,`112214`,`112412`,`122114`,`122411`,`142112`,`142211`,`241211`,`221114`,`413111`,`241112`,`134111`,`111242`,`121142`,`121241`,`114212`,`124112`,`124211`,`411212`,`421112`,`421211`,`212141`,`214121`,`412121`,`111143`,`111341`,`131141`,`114113`,`114311`,`411113`,`411311`,`113141`,`114131`,`311141`,`411131`,`211412`,`211214`,`211232`,`2331112`],dv=104,dw=106,dx=(dy)=>{return ((() => {
      const text = dy;
      const patterns = du;
      const START_B = dv;
      const STOP = dw;

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
    })())},dz=C(``),ea=(eb)=>{return (dx(eb).length)},ec=C(0),ed=(ee)=>{return D(()=>{dt.value=ee;dz.value=dx(ee);ec.value=ea(ee)})},ef=()=>{return D(()=>{dk.value=dg(df.value,dj.value);dn.value=dl(df.value)})},eg=()=>{return D(()=>{dz.value=dx(dt.value);ec.value=ea(dt.value)})},eh=()=>{return D(()=>{dk.value=dg(df.value,dj.value);dn.value=dl(df.value);dz.value=dx(dt.value);ec.value=ea(dt.value)})},ei=()=>{return [a({title:`Website URL`,content:`https://mint-lang.com`,description:`Escanea para visitar el sitio web oficial de Mint Lang`}),a({title:`Email Contact`,content:`mailto:contact@example.com?subject=Hello&body=Hi there!`,description:`Escanea para enviar un email preconfigurado`}),a({title:`WiFi Network`,content:`WIFI:T:WPA;S:MiRed;P:password123;H:false;;`,description:`Escanea para conectarte automáticamente a WiFi`}),a({title:`Phone Number`,content:`tel:+1234567890`,description:`Escanea para llamar directamente`}),a({title:`SMS Message`,content:`sms:+1234567890?body=Hello from Mint Lang!`,description:`Escanea para enviar SMS preconfigurado`}),a({title:`vCard Contact`,content:`BEGIN:VCARD\\nVERSION:3.0\\nFN:John Doe\\nTEL:+1234567890\\nEMAIL:john@example.com\\nEND:VCARD`,description:`Escanea para agregar contacto a tu teléfono`}),a({title:`Geolocation`,content:`geo:37.7749,-122.4194`,description:`Escanea para abrir ubicación en mapas (San Francisco)`}),a({title:`Event Calendar`,content:`BEGIN:VEVENT\\nSUMMARY:Mint Lang Workshop\\nDTSTART:20250201T100000\\nDTEND:20250201T120000\\nEND:VEVENT`,description:`Escanea para agregar evento al calendario`}),a({title:`Payment (Bitcoin)`,content:`bitcoin:1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa?amount=0.001`,description:`Escanea para realizar pago con Bitcoin`}),a({title:`WhatsApp Message`,content:`https://wa.me/1234567890?text=Hello from Mint Lang!`,description:`Escanea para enviar mensaje de WhatsApp`}),a({title:`YouTube Video`,content:`https://www.youtube.com/watch?v=dQw4w9WgXcQ`,description:`Escanea para ver video en YouTube`}),a({title:`JSON Data`,content:`{\\"name\\":\\"Mint Lang\\",\\"type\\":\\"Programming Language\\",\\"year\\":2025}`,description:`Escanea para obtener datos JSON estructurados`})]},ej=()=>{return [a({title:`Product SKU`,content:`PROD-2025-001`,description:`Código de producto para inventario`}),a({title:`Order Number`,content:`ORD-20250104-ABC123`,description:`Número de orden para seguimiento`}),a({title:`Serial Number`,content:`SN-MINT-78945612`,description:`Número de serie de dispositivo`}),a({title:`License Plate`,content:`ABC-1234`,description:`Placa de vehículo`}),a({title:`Batch Code`,content:`BATCH-A-2025-01`,description:`Código de lote de producción`}),a({title:`Tracking Code`,content:`TRACK-XYZ-456789`,description:`Código de rastreo de paquete`}),a({title:`ISBN Book`,content:`ISBN-978-3-16-148410-0`,description:`Código ISBN de libro`}),a({title:`Membership ID`,content:`MEMBER-GOLD-9876`,description:`ID de membresía premium`}),a({title:`Ticket Number`,content:`TICKET-2025-A1B2C3`,description:`Número de ticket de evento`}),a({title:`Asset Tag`,content:`ASSET-IT-LAPTOP-042`,description:`Etiqueta de activo empresarial`}),a({title:`Coupon Code`,content:`DISCOUNT-50OFF-2025`,description:`Código de cupón de descuento`}),a({title:`Container ID`,content:`CONT-PORT-A-5678`,description:`ID de contenedor de carga`})]},BC=({ek=8,el=4})=>{H(()=>{(()=>{return ((() => {
      setTimeout(() => {
        const canvas = document.querySelector('[data-qr-canvas]');
        if (!canvas) return;

        const ctx = canvas.getContext('2d');
        const matrix = JSON.parse(dk.value || '[]');
        const size = dn.value;
        const moduleSize = ek;
        const quietZone = el;

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
    })())})()},[]);I(()=>{return em()});return F(`canvas`,{"data-qr-canvas":`true`,className:`a`})},BD=({en=100,eo=2})=>{H(()=>{(()=>{return ((() => {
      setTimeout(() => {
        const canvas = document.querySelector('[data-barcode-canvas]');
        if (!canvas) return;

        const ctx = canvas.getContext('2d');
        const pattern = dz.value;
        const barHeight = en;
        const barWidth = eo;

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
    })())})()},[]);I(()=>{return ep()});return F(`div`,{},[F(`canvas`,{"data-barcode-canvas":`true`,className:`b`}),F(`div`,{className:`c`},[dt.value])])},BE=()=>{const eq=G([]),er=G([]),es=(et)=>{return dp(et)},eu=(ev)=>{return ed(ev)},ew=(ex)=>{return F(`div`,{"onClick":(ey)=>{return es(ex.content)},className:`ai`},[F(`div`,{className:`aj`},[ex.title]),F(`div`,{className:`ak`},[ex.description]),F(`code`,{className:`al`},[ex.content])])},ez=(fa)=>{return F(`div`,{"onClick":(fb)=>{return eu(fa.content)},className:`ai`},[F(`div`,{className:`aj`},[fa.title]),F(`div`,{className:`ak`},[fa.description]),F(`code`,{className:`al`},[fa.content])])};H(()=>{(()=>{D(()=>{eq.value=ei();er.value=ej()});return eh()})()},[]);return F(`div`,{className:`w`},[F(`div`,{className:`x`},[F(`h1`,{className:`y`},[`QR Codes & Barcodes`]),F(`p`,{className:`z`},[`Generate scannable QR codes and CODE128 barcodes in real-time`])]),F(`div`,{className:`aa`},[F(`div`,{className:`ab`},[F(`span`,{className:`ae`},[`📱`]),`QR Code Generator`,F(`span`,{className:`af`},[`Live`])]),F(`div`,{className:`ac`},[F(`div`,{},[F(`p`,{className:`ag`},[`📋 Current Content: `,df.value]),F(`div`,{className:`am`},[`📚 Click an example to load:`]),F(`div`,{className:`ah`},[(()=>{const _0=[];const _1=eq.value;let _i=-1;for(let fc of _1){_i++;_0.push(ew(fc))};return _0})()])]),F(`div`,{className:`ad`},[F(BC,{ek:6,el:4})])])]),F(`div`,{className:`aa`},[F(`div`,{className:`ab`},[F(`span`,{className:`ae`},[`📊`]),`CODE128 Barcode Generator`,F(`span`,{className:`af`},[`Live`])]),F(`div`,{className:`ac`},[F(`div`,{},[F(`p`,{className:`ag`},[`📋 Current Text: `,dt.value]),F(`div`,{className:`am`},[`📚 Click an example to load:`]),F(`div`,{className:`ah`},[(()=>{const _0=[];const _1=er.value;let _i=-1;for(let fd of _1){_i++;_0.push(ez(fd))};return _0})()])]),F(`div`,{className:`ad`},[F(BD,{en:120,eo:3})])])])])},BF=()=>{const fe=(ff)=>{return y(ff)},fg=(fh)=>{return ad(fh)},fi=()=>{return ag()},fj=()=>{return af()},fk=(fl,fm,fn)=>{return F(`div`,{"onClick":(fo)=>{return fe(fl)},className:(E(t.value,fl)?`selected`:``) + ` k`},[F(`div`,{className:`l`,style:K([`background: ` + fn + `;`])}),F(`span`,{className:`m`},[fm])])},fp=(fq)=>{return F(`div`,{"onClick":(fr)=>{return fg(fq)},className:(E(aa.value,fq)?`selected`:``) + ` p`,style:K([`background: ` + fq + `;`])})};return F(`div`,{className:`d`},[F(`div`,{className:`e`},[F(`div`,{className:`f`},[F(`h2`,{className:`g`},[`Customize Theme`]),F(`div`,{className:`q`},[F(`button`,{"onClick":(fs)=>{return fi()},className:`r`},[`Reset`]),F(`button`,{"onClick":(ft)=>{return fj()},className:`primary` + ` r`},[`Apply Theme`])])]),F(`div`,{className:`h`},[F(`label`,{className:`i`},[`Theme Preset`]),F(`div`,{className:`j`},[fk(`default`,`Default`,`linear-gradient(135deg, #667eea 0%, #764ba2 100%)`),fk(`dark`,`Dark`,`#1a1a1a`),fk(`light`,`Light`,`#ffffff`),fk(`blue`,`Blue Ocean`,`linear-gradient(135deg, #1e3c72 0%, #2a5298 100%)`),fk(`green`,`Nature`,`linear-gradient(135deg, #134e5e 0%, #71b280 100%)`)])]),F(`div`,{className:`h`},[F(`label`,{className:`i`},[`Accent Color`]),F(`div`,{className:`n`},[F(`input`,{"type":`text`,"value":aa.value,className:`o`}),fp(`#1989fa`),fp(`#5a54f9`),fp(`#9e339f`),fp(`#ed4192`),fp(`#e0282e`),fp(`#f4801a`),fp(`#f2bd27`),fp(`#00b96b`)])])])])},BG=()=>{return F(`div`,{className:`s`},[F(`div`,{className:`t`},[F(`h1`,{className:`u`},[`Theme Customizer`]),F(`p`,{className:`v`},[`Customize your application theme with colors, radius, and presets. `,`Changes apply in real-time to preview your theme.`])]),F(BF,{})])},fu=()=>{return new T()},fv=(fw)=>{return (fw.length)},fx=(fy,fz)=>{return L(T,U,fy,fz)},ga=(gb,gc)=>{return M(gb,[[N(S,[O]),(gd)=>{return P(S)(gc(gd))}],[N(T,[]),()=>{return new T()}]])},ge=(gf,gg)=>{return Q(gf,gg,S,T)},gh=(gi)=>{return (gi.toString())},gj=(gk)=>{return (Math.floor(gk))},BH=({gl=[],gm=[],gn=[],go=fu(),gp=``,gq=`100%`,gr=`auto`,gs=false,gt=false,gu=false,gv=true,gw=true,gx=true})=>{const gy=G(false),gz=G(0),ha=G(0),hb=G(0),hc=G(1),hd=G(1),he=G(false),hf=G(0),hg=G(-1),hh=G(0),hi=G(true),hj=G(false),hk=G(false),hl=G(false),hm=G(false),hn=G(false),ho=G(false),hp=G(false),hq=G(false),hr=G(false),hs=G(false),ht=G(0),hu=G(false),hv=G(0),hw=G(0),hx=G(0),hy=G(0),hz=G(0),ia=G(0),ib=(ic)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        if (video.paused) {
          video.play();
        } else {
          video.pause();
        }
      }
    })());return (gw?(gy.value?D(()=>{gy.value=false;hy.value=hy.value + 1}):D(()=>{gy.value=true;hx.value=hx.value + 1})):(()=>{gy.value=!gy.value})())},id=(ie)=>{return ig(ie)},ih=(ii)=>{((() => {
      const progressBar = event.currentTarget;
      const rect = progressBar.getBoundingClientRect();
      const x = event.clientX - rect.left;
      const percentage = x / rect.width;

      const video = document.querySelector('[data-pro-video]');
      if (video && video.duration) {
        video.currentTime = percentage * video.duration;
      }
    })());return (()=>{hz.value=hz.value + 1})()},ij=(ik)=>{((() => {
      const progressBar = event.currentTarget;
      const rect = progressBar.getBoundingClientRect();
      const x = event.clientX - rect.left;
      const percentage = Math.max(0, Math.min(1, x / rect.width));

      const video = document.querySelector('[data-pro-video]');
      if (video && video.duration) {
        const time = percentage * video.duration;
        il((true),(time),(x))
      }
    })());return u(null)},im=(io)=>{return (()=>{hu.value=false})()},ip=(iq)=>{return (()=>{hj.value=!hj.value})()},ir=(is)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        video.muted = !video.muted;
      }
    })());return D(()=>{he.value=!he.value;hc.value=(he.value?1:0)})},it=(iu)=>{return D(()=>{hk.value=!hk.value;hl.value=false;hm.value=false;ho.value=false})},iv=(iw)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        video.playbackRate = iw;
      }
    })());return D(()=>{hd.value=iw;hk.value=false})},ix=(iy)=>{return D(()=>{hl.value=!hl.value;hk.value=false;hm.value=false;ho.value=false})},iz=(ja)=>{((() => {
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
    })());return D(()=>{hf.value=ja;hl.value=false;ia.value=ia.value + 1})},jb=(jc)=>{return D(()=>{hm.value=!hm.value;hk.value=false;hl.value=false;ho.value=false})},jd=(je)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        const tracks = video.textTracks;
        for (let i = 0; i < tracks.length; i++) {
          tracks[i].mode = i === je ? 'showing' : 'hidden';
        }
      }
    })());return D(()=>{hg.value=je;hm.value=false})},ig=(jf)=>{((() => {
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
    })());return (()=>{hp.value=!hp.value})()},jg=(jh)=>{((() => {
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
    })());return u(null)},ji=(jj)=>{return (()=>{hq.value=!hq.value})()},jk=(jl)=>{return (()=>{hq.value=false})()},jm=(jn)=>{return (()=>{hn.value=!hn.value})()},jo=(jp)=>{return D(()=>{hh.value=jp;hn.value=false})},jq=(jr)=>{const js=(hh.value < fv(gl) - 1?hh.value + 1:0);return (()=>{hh.value=js})()},jt=(ju)=>{const jv=(hh.value > 0?hh.value - 1:fv(gl) - 1);return (()=>{hh.value=jv})()},jw=(jx)=>{return (()=>{hi.value=true})()},jy=(jz)=>{return (gy.value?D(()=>{hi.value=false;hj.value=false}):u(null))},ka=(kb)=>{return (()=>{hi.value=true})()},kc=(kd,ke,kf,kg)=>{return D(()=>{gz.value=kd;ha.value=ke;hb.value=kf;hr.value=kg})},kh=(ki)=>{return (()=>{gy.value=ki})()},kj=(kk)=>{return (()=>{hc.value=kk})()},kl=(km)=>{return (()=>{hr.value=km})()},kn=(ko)=>{return (()=>{hp.value=ko})()},il=(kp,kq,kr)=>{return D(()=>{hu.value=kp;ht.value=kq;hv.value=kr})},ks=()=>{return ((() => {
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

        kc((currentTime),(duration),(bufferedEnd),(isLoading))
      }
    })())},kt=()=>{return (fv(gl) > 0?ku():(gu?(()=>{((() => {
        const video = document.querySelector('[data-pro-video]');
        if (video) {
          video.currentTime = 0;
          video.play();
        }
      })());return u(null)})():(()=>{gy.value=false})()))},ku=()=>{const kv=(hh.value < fv(gl) - 1?hh.value + 1:0);return (()=>{hh.value=kv})()},kw=(kx)=>{const ky=gj(kx / 3600);const kz=gj((kx % 3600) / 60);const la=gj(kx % 60);const lb=(kz < 10?`0` + gh(kz):gh(kz));const lc=(la < 10?`0` + gh(la):gh(la));return (ky > 0?gh(ky) + `:` + lb + `:` + lc:gh(kz) + `:` + lc)},ld=()=>{return (ha.value > 0?(gz.value / ha.value) * 100:0)},le=()=>{return (ha.value > 0?(hb.value / ha.value) * 100:0)},lf=()=>{return (fv(gm) > 0?fx(ga(ge(gm,hf.value),(lg)=>{return lg.src}),``):(fv(gl) > 0?fx(ga(ge(gl,hh.value),(lh)=>{return lh.src}),``):``))},li=()=>{return (fv(gl) > 0?fx(ga(ge(gl,hh.value),(lj)=>{return lj.poster}),gp):gp)},lk=()=>{return (he.value || E(hc.value,0)?`🔇`:(hc.value > 0.5?`🔊`:`🔉`))},ll=()=>{const _={[`--b-a`]:gq,[`--b-b`]:gr};return _};H(()=>{(()=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      const container = document.querySelector('[data-pro-container]');

      if (video) {
        // Time update
        video.addEventListener('timeupdate', () => {
          ks()
        });

        // Metadata loaded
        video.addEventListener('loadedmetadata', () => {
          ks()
        });

        // Waiting/buffering
        video.addEventListener('waiting', () => {
          kl((true))
        });

        // Can play
        video.addEventListener('canplay', () => {
          kl((false))
        });

        // Ended
        video.addEventListener('ended', () => {
          kt()
        });

        // Volume change
        video.addEventListener('volumechange', () => {
          kj((video.volume))
        });

        // Play/Pause
        video.addEventListener('play', () => {
          kh((true))
        });

        video.addEventListener('pause', () => {
          kh((false))
        });
      }

      // Keyboard events
      if (gv) {
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
        kn((isFs))
      });
    })());return u(null)})()},[]);return F(`div`,{"data-pro-container":`true`,"onMouseEnter":jw,"onMouseLeave":jy,"onMouseMove":ka,"onDoubleClick":id,className:(hp.value?`fullscreen`:(hq.value?`mini`:``)) + ` as`,style:K([ll()])},[(hq.value?F(`div`,{className:`cc`},[F(`button`,{"onClick":ji,"title":`Restore`,className:`cd`},[`⛶`]),F(`button`,{"onClick":jk,"title":`Close`,className:`cd`},[`✕`])]):null),F(`video`,{"data-pro-video":`true`,"src":lf(),"poster":li(),className:`at`},[(()=>{const _0=[];const _1=gn;let _i=-1;for(let lm of _1){_i++;_0.push((lm.isDefault?F(`track`,{"label":lm.label,"kind":`subtitles`,"srcLang":lm.language,"src":lm.src,"default":`true`}):F(`track`,{"label":lm.label,"kind":`subtitles`,"srcLang":lm.language,"src":lm.src})))};return _0})()]),(hr.value?F(`div`,{className:`au`},[F(`div`,{className:`av`})]):null),(!gy.value && !hq.value?F(`div`,{className:`aw ax`},[F(`button`,{"onClick":ib,className:`ay`},[`▶`])]):null),F(`div`,{className:`az`,style:K([(hi.value || !gy.value?`opacity: 1`:`opacity: 0`)])},[F(`div`,{className:`ba`},[F(`div`,{"onClick":ih,"onMouseMove":ij,"onMouseLeave":im,className:`bb`},[F(`div`,{className:(hu.value?`progressBarHover`:``) + ` bc`},[F(`div`,{className:`bd`,style:K([`width: ` + gh(le()) + `%`])}),F(`div`,{className:`be`,style:K([`width: ` + gh(ld()) + `%`])},[F(`div`,{className:(hu.value?`thumbVisible`:``) + ` bf`})])]),(hu.value?F(`div`,{className:`bg bh`,style:K([`left: ` + gh(hv.value) + `px`])},[F(`div`,{className:`bi`}),F(`div`,{className:`bj`},[kw(ht.value)])]):null)])]),F(`div`,{className:`bk`},[F(`button`,{"onClick":ib,"title":`Play/Pause (Space)`,className:`bl`},[(gy.value?`⏸`:`▶`)]),(fv(gl) > 1?F(`button`,{"onClick":jt,"title":`Previous`,className:`bl`},[`⏮`]):null),(fv(gl) > 1?F(`button`,{"onClick":jq,"title":`Next`,className:`bl`},[`⏭`]):null),F(`div`,{"onMouseEnter":ip,"onMouseLeave":ip,className:`bm`},[F(`button`,{"onClick":ir,"title":`Mute (M)`,className:`bl`},[lk()]),F(`div`,{className:(hj.value?`visible`:``) + ` bn`},[F(`div`,{className:`bo`},[F(`div`,{className:`bp`,style:K([`width: ` + gh(hc.value * 100) + `%`])})])])]),F(`div`,{className:`bq`},[kw(gz.value),` / `,kw(ha.value)]),F(`div`,{className:`br`}),(fv(gn) > 0 && !hq.value?F(`div`,{style:K([`position: relative;`])},[F(`button`,{"onClick":jb,"title":`Captions`,className:`bl`},[`CC`]),(hm.value?F(`div`,{className:`bs`},[F(`div`,{"onClick":(ln)=>{return jd(-1)},className:(E(hg.value,-1)?`active`:``) + ` bt`},[`Off`]),(()=>{const _0=[];const _1=gn;let _i=-1;for(let lo of _1){_i++;const lp=_i;_0.push(F(`div`,{"onClick":(lq)=>{return jd(lp)},className:(E(hg.value,lp)?`active`:``) + ` bt`},[lo.label,(E(hg.value,lp)?F(`span`,{className:`bu`},[`✓`]):null)]))};return _0})()]):null)]):null),(fv(gm) > 1 && !hq.value?F(`div`,{style:K([`position: relative;`])},[F(`button`,{"onClick":ix,"title":`Quality`,className:`bl`},[`⚙`]),(hl.value?F(`div`,{className:`bs`},[(()=>{const _0=[];const _1=gm;let _i=-1;for(let lr of _1){_i++;const ls=_i;_0.push(F(`div`,{"onClick":(lt)=>{return iz(ls)},className:(E(hf.value,ls)?`active`:``) + ` bt`},[lr.label,(E(hf.value,ls)?F(`span`,{className:`bu`},[`✓`]):null)]))};return _0})()]):null)]):null),(!hq.value?F(`div`,{style:K([`position: relative;`])},[F(`button`,{"onClick":it,"title":`Speed`,className:`bl`},[(E(hd.value,1)?`1x`:gh(hd.value) + `x`)]),(hk.value?F(`div`,{className:`bs`},[F(`div`,{"onClick":(lu)=>{return iv(0.25)},className:(E(hd.value,0.25)?`active`:``) + ` bt`},[`0.25x`]),F(`div`,{"onClick":(lv)=>{return iv(0.5)},className:(E(hd.value,0.5)?`active`:``) + ` bt`},[`0.5x`]),F(`div`,{"onClick":(lw)=>{return iv(0.75)},className:(E(hd.value,0.75)?`active`:``) + ` bt`},[`0.75x`]),F(`div`,{"onClick":(lx)=>{return iv(1)},className:(E(hd.value,1)?`active`:``) + ` bt`},[`Normal`]),F(`div`,{"onClick":(ly)=>{return iv(1.25)},className:(E(hd.value,1.25)?`active`:``) + ` bt`},[`1.25x`]),F(`div`,{"onClick":(lz)=>{return iv(1.5)},className:(E(hd.value,1.5)?`active`:``) + ` bt`},[`1.5x`]),F(`div`,{"onClick":(ma)=>{return iv(1.75)},className:(E(hd.value,1.75)?`active`:``) + ` bt`},[`1.75x`]),F(`div`,{"onClick":(mb)=>{return iv(2)},className:(E(hd.value,2)?`active`:``) + ` bt`},[`2x`])]):null)]):null),(fv(gl) > 0 && !hq.value?F(`button`,{"onClick":jm,"title":`Playlist`,className:`bl`},[`☰`]):null),(gx && !hp.value && !hq.value?F(`button`,{"onClick":ji,"title":`Mini Player`,className:`bl`},[`⧉`]):null),(!hq.value?F(`button`,{"onClick":jg,"title":`Picture-in-Picture`,className:`bl`},[`⧉`]):null),(!hq.value?F(`button`,{"onClick":ig,"title":`Fullscreen (F)`,className:`bl`},[(hp.value?`⛶`:`⛶`)]):null)])]),(fv(gl) > 0?F(`div`,{className:`bv`,style:K([(hn.value?`transform: translateX(0)`:``)])},[F(`div`,{className:`bw`},[`Playlist (`,gh(fv(gl)),` videos)`]),(()=>{const _0=[];const _1=gl;let _i=-1;for(let mc of _1){_i++;const md=_i;_0.push(F(`div`,{"onClick":(me)=>{return jo(md)},className:(E(hh.value,md)?`active`:``) + ` bx`},[F(`img`,{"src":mc.poster,"alt":mc.title,className:`by`}),F(`div`,{className:`bz`},[F(`div`,{className:`ca`},[mc.title]),F(`div`,{className:`cb`},[kw(mc.duration)])])]))};return _0})()]):null)])},mf=(mg,mh)=>{return (mg.includes(mh))},BI=({mi=``,mj=`100%`,mk=`500px`,ml=false,mm=false,mn=true})=>{const mo=G(``),mp=G(``),mq=()=>{const mr=ms(mi);return D(()=>{mo.value=mr.platform;mp.value=mr.videoId})},ms=(mt)=>{return (mf(mt,`youtube.com`) || mf(mt,`youtu.be`)?f({platform:`youtube`,videoId:mu(mt)}):(mf(mt,`vimeo.com`)?f({platform:`vimeo`,videoId:mv(mt)}):(mf(mt,`dailymotion.com`) || mf(mt,`dai.ly`)?f({platform:`dailymotion`,videoId:mw(mt)}):f({platform:`unknown`,videoId:``}))))},mu=(mx)=>{return ((() => {
      const url = mx;
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
    })())},mv=(my)=>{return ((() => {
      const url = my;
      let videoId = '';

      // Standard vimeo.com URL
      if (url.includes('vimeo.com/')) {
        const parts = url.split('vimeo.com/');
        if (parts[1]) {
          videoId = parts[1].split('/')[0].split('?')[0] || '';
        }
      }

      return videoId;
    })())},mw=(mz)=>{return ((() => {
      const url = mz;
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
    })())},na=()=>{const nb=(ml?`1`:`0`);const nc=(mm?`1`:`0`);const nd=(mn?`1`:`0`);return M(mo.value,[[`youtube`,()=>{return `https://www.youtube.com/embed/` + mp.value + `?autoplay=` + nb + `&mute=` + nc + `&controls=` + nd}],[`vimeo`,()=>{return `https://player.vimeo.com/video/` + mp.value + `?autoplay=` + nb + `&muted=` + nc + `&controls=` + nd}],[`dailymotion`,()=>{return `https://www.dailymotion.com/embed/video/` + mp.value + `?autoplay=` + nb + `&mute=` + nc + `&controls=` + nd}],[null,()=>{return ``}]])},ne=()=>{const _={[`--a-a`]:mj,[`--a-b`]:mk};return _};H(()=>{(()=>{return mq()})()},[]);I(()=>{return mq()});return F(`div`,{className:`an`,style:K([ne()])},[(bp(mp.value) && bp(mo.value)?F(`iframe`,{"src":na(),"allow":`accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture`,"allowfullscreen":`true`,className:`ao`}):(bn(mi)?F(`div`,{className:`ap`},[F(`div`,{className:`aq`},[`🎬`]),F(`div`,{className:`ar`},[`Enter a video URL to start`]),F(`div`,{style:K([`font-size: 12px; color: var(--text-color, #999);`])},[`Supports YouTube, Vimeo, and Dailymotion`])]):F(`div`,{className:`ap`},[F(`div`,{className:`aq`},[`⚠️`]),F(`div`,{className:`ar`},[`Unsupported video platform`]),F(`div`,{style:K([`font-size: 12px; color: var(--text-color, #999);`])},[`Please use YouTube, Vimeo, or Dailymotion URLs`])])))])},BJ=()=>{return F(`div`,{className:`ce`},[F(`div`,{className:`cf`},[F(`h1`,{className:`cg`},[`🎬 Video Players`]),F(`p`,{className:`ch`},[`Professional video player with all advanced features: keyboard shortcuts, playlist, quality selector, subtitles, analytics, mini-player, PiP, and external platform support (YouTube, Vimeo)`])]),F(`div`,{className:`ci`},[F(`h2`,{className:`cj`},[`🚀 Pro Video Player`,F(`span`,{className:`cu`},[`Ultimate`])]),F(`div`,{className:`ck`},[F(`div`,{className:`cm`},[F(`h3`,{className:`cn`},[`Full-Featured Professional Player with Playlist`]),F(BH,{gm:[e({label:`1080p`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4`,height:1080}),e({label:`720p`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4`,height:720}),e({label:`480p`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4`,height:480})],gn:[d({label:`English`,src:`/captions/en.vtt`,language:`en`,isDefault:true})],gl:[g({id:`1`,title:`Big Buck Bunny`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4`,poster:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg`,duration:596}),g({id:`2`,title:`Elephants Dream`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4`,poster:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg`,duration:653}),g({id:`3`,title:`For Bigger Blazes`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4`,poster:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg`,duration:15})],gp:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg`,gq:`100%`,gr:`600px`,gv:true,gw:true}),F(`p`,{className:`ct`},[`🔥 Professional player with: Keyboard shortcuts (Space, ←→ seek, ↑↓ volume, F fullscreen, M mute, J/L 10s jumps, 0-9 percentage jumps), seek preview, buffer indicator, playlist, mini-player mode, analytics tracking, and all controls!`])]),F(`div`,{className:`cm`},[F(`h3`,{className:`cn`},[`Pro Player - Single Video with Auto-play`]),F(BH,{gm:[e({label:`HD`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4`,height:720})],gp:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg`,gq:`100%`,gr:`500px`,gs:true,gt:true,gv:true}),F(`p`,{className:`ct`},[`⚡ All pro features in a single video configuration`])])])]),F(`div`,{className:`ci`},[F(`h2`,{className:`cj`},[`🌐 Embed Player (YouTube, Vimeo, Dailymotion)`,F(`span`,{className:`cu`},[`External`])]),F(`div`,{className:`cl`},[F(`div`,{className:`cm`},[F(`h3`,{className:`cn`},[`YouTube Video`]),F(BI,{mi:`https://www.youtube.com/watch?v=dQw4w9WgXcQ`,mj:`100%`,mk:`400px`,mn:true}),F(`p`,{className:`ct`},[`📺 Supports standard YouTube URLs, short URLs (youtu.be), and embed URLs`])]),F(`div`,{className:`cm`},[F(`h3`,{className:`cn`},[`Vimeo Video`]),F(BI,{mi:`https://vimeo.com/148751763`,mj:`100%`,mk:`400px`,mn:true}),F(`p`,{className:`ct`},[`🎬 Clean Vimeo player integration with responsive design`])])])]),F(`div`,{className:`ci`},[F(`h2`,{className:`cj`},[`✨ Feature Comparison`]),F(`table`,{className:`cv`},[F(`thead`,{},[F(`tr`,{},[F(`th`,{className:`cw`},[`Feature`]),F(`th`,{className:`cw`},[`ProVideoPlayer`]),F(`th`,{className:`cw`},[`EmbedPlayer`])])]),F(`tbody`,{},[F(`tr`,{},[F(`td`,{className:`cx`},[`Play/Pause`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓`])]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓`])])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Progress Bar with Preview`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ Hover preview`])]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓`])])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Volume Control`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ Slider + Mute`])]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓`])])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Playback Speed`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ (0.25x - 2x)`])]),F(`td`,{className:`cx`},[`Platform-dependent`])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Quality Selector`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ Multi-source`])]),F(`td`,{className:`cx`},[`Platform-dependent`])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Subtitles/Captions`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ VTT format`])]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓`])])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Fullscreen`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ + Double-click`])]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓`])])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Picture-in-Picture`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓`])]),F(`td`,{className:`cx`},[`Browser-dependent`])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Keyboard Shortcuts`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ (15+ keys)`])]),F(`td`,{className:`cx`},[`Platform-dependent`])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Buffer Indicator`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ Visual bar`])]),F(`td`,{className:`cx`},[`Platform-dependent`])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Playlist Support`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ Auto-advance`])]),F(`td`,{className:`cx`},[`✗`])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Mini-Player`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ Floating mode`])]),F(`td`,{className:`cx`},[`✗`])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Analytics Tracking`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ 5 metrics`])]),F(`td`,{className:`cx`},[`✗`])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Loading State`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ Spinner`])]),F(`td`,{className:`cx`},[`Platform-dependent`])]),F(`tr`,{},[F(`td`,{className:`cx`},[`Theme Integration`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓`])]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓`])])]),F(`tr`,{},[F(`td`,{className:`cx`},[`External Platforms`]),F(`td`,{className:`cx`},[`✗`]),F(`td`,{className:`cx`},[F(`span`,{className:`cy`},[`✓ YouTube, Vimeo`])])])])])]),F(`div`,{className:`ci`},[F(`h2`,{className:`cj`},[`🎯 All Features`]),F(`div`,{className:`co`},[F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`▶️`]),F(`h3`,{className:`cr`},[`Play/Pause`]),F(`p`,{className:`cs`},[`Smooth playback control with visual feedback`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`⏱️`]),F(`h3`,{className:`cr`},[`Speed Control`]),F(`p`,{className:`cs`},[`0.25x to 2x playback speed`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`🔊`]),F(`h3`,{className:`cr`},[`Volume`]),F(`p`,{className:`cs`},[`Slider control with mute toggle`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`⚙️`]),F(`h3`,{className:`cr`},[`Quality`]),F(`p`,{className:`cs`},[`Multiple quality options`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`CC`]),F(`h3`,{className:`cr`},[`Subtitles`]),F(`p`,{className:`cs`},[`VTT caption track support`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`⛶`]),F(`h3`,{className:`cr`},[`Fullscreen`]),F(`p`,{className:`cs`},[`Native fullscreen API`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`⧉`]),F(`h3`,{className:`cr`},[`PiP Mode`]),F(`p`,{className:`cs`},[`Picture-in-Picture support`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`🎨`]),F(`h3`,{className:`cr`},[`Theming`]),F(`p`,{className:`cs`},[`Full CSS variable support`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`⌨️`]),F(`h3`,{className:`cr`},[`Keyboard`]),F(`p`,{className:`cs`},[`Space, arrows shortcuts`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`📱`]),F(`h3`,{className:`cr`},[`Responsive`]),F(`p`,{className:`cs`},[`Mobile-friendly design`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`🌐`]),F(`h3`,{className:`cr`},[`Embeds`]),F(`p`,{className:`cs`},[`YouTube, Vimeo, Dailymotion`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`⚡`]),F(`h3`,{className:`cr`},[`Performance`]),F(`p`,{className:`cs`},[`Optimized HTML5 video`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`🎮`]),F(`h3`,{className:`cr`},[`Playlist`]),F(`p`,{className:`cs`},[`Auto-advance queue system`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`📊`]),F(`h3`,{className:`cr`},[`Analytics`]),F(`p`,{className:`cs`},[`Track play, pause, seek, watch time`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`🔍`]),F(`h3`,{className:`cr`},[`Seek Preview`]),F(`p`,{className:`cs`},[`Hover to preview timestamp`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`📦`]),F(`h3`,{className:`cr`},[`Buffer Bar`]),F(`p`,{className:`cs`},[`Visual buffering indicator`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`🎬`]),F(`h3`,{className:`cr`},[`Mini Player`]),F(`p`,{className:`cs`},[`Floating player mode`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`🎯`]),F(`h3`,{className:`cr`},[`Precise Control`]),F(`p`,{className:`cs`},[`Frame-accurate seeking`])]),F(`div`,{className:`cp`},[F(`div`,{className:`cq`},[`🔢`]),F(`h3`,{className:`cr`},[`Jump to %`]),F(`p`,{className:`cs`},[`Press 0-9 for percentage`])])])])])},BK=({nf=o({data:[]}),ng=[50],nh=[100],ni=false,nj=0})=>{const nk=(nl)=>{return F(`div`,{"key":gh(nl.x) + `-` + gh(nl.y),style:K([`position: absolute; ` + `top: ` + gh(nl.y * 60) + `px; ` + `left: ` + gh(nl.x * 120) + `px; ` + `width: ` + gh(nl.col * 120 - 2) + `px; ` + `height: ` + gh(nl.row * 60 - 2) + `px; ` + `border: 1px solid #ddd; display: flex; align-items: center; justify-content: center; padding: 10px;`])},[nl.text])};return F(`div`,{style:K([`border: 1px solid #ddd; position: relative; height: 400px; width: 600px;`])},[(()=>{const _0=[];const _1=nf.data;let _i=-1;for(let nm of _1){_i++;_0.push(nk(nm))};return _0})()])},BL=()=>{const nn=()=>{return o({data:[n({x:0,y:0,col:1,row:1,text:`A1`,className:``}),n({x:1,y:0,col:1,row:1,text:`B1`,className:``}),n({x:2,y:0,col:1,row:1,text:`C1`,className:``}),n({x:0,y:1,col:1,row:1,text:`A2`,className:``}),n({x:1,y:1,col:1,row:1,text:`B2`,className:``}),n({x:2,y:1,col:1,row:1,text:`C2`,className:``}),n({x:0,y:2,col:1,row:1,text:`A3`,className:``}),n({x:1,y:2,col:1,row:1,text:`B3`,className:``}),n({x:2,y:2,col:1,row:1,text:`C3`,className:``})]})},no=()=>{return o({data:[n({x:0,y:0,col:2,row:1,text:`Merged Header`,className:``}),n({x:2,y:0,col:1,row:2,text:`Tall Cell`,className:``}),n({x:0,y:1,col:1,row:1,text:`A2`,className:``}),n({x:1,y:1,col:1,row:1,text:`B2`,className:``}),n({x:0,y:2,col:3,row:1,text:`Wide Footer`,className:``})]})},np=()=>{return o({data:[n({x:0,y:0,col:1,row:1,text:`Name`,className:`header-cell`}),n({x:1,y:0,col:1,row:1,text:`Age`,className:`header-cell`}),n({x:2,y:0,col:1,row:1,text:`City`,className:`header-cell`}),n({x:0,y:1,col:1,row:1,text:`Alice`,className:``}),n({x:1,y:1,col:1,row:1,text:`25`,className:``}),n({x:2,y:1,col:1,row:1,text:`NYC`,className:``}),n({x:0,y:2,col:1,row:1,text:`Bob`,className:``}),n({x:1,y:2,col:1,row:1,text:`30`,className:``}),n({x:2,y:2,col:1,row:1,text:`LA`,className:``}),n({x:0,y:3,col:1,row:1,text:`Carol`,className:``}),n({x:1,y:3,col:1,row:1,text:`28`,className:``}),n({x:2,y:3,col:1,row:1,text:`SF`,className:``})]})};return F(`div`,{className:`hc`},[F(`h1`,{className:`hd`},[`Matrix`,F(`span`,{className:`hk`},[`Grid Layout`])]),F(`p`,{className:`he`},[`Flexible grid layout component with support for merged cells and fixed headers. `,`Perfect for complex table layouts and dashboard grids.`]),F(`ul`,{className:`hl`},[F(`li`,{className:`hm`},[`Support for merged cells (colspan/rowspan)`]),F(`li`,{className:`hm`},[`Fixed first column or row`]),F(`li`,{className:`hm`},[`Flexible cell sizing`]),F(`li`,{className:`hm`},[`Conflict detection for overlapping cells`]),F(`li`,{className:`hm`},[`Responsive scrolling`])]),F(`div`,{className:`hf`},[F(`h2`,{className:`hg`},[`Basic Grid`]),F(`p`,{className:`hh`},[`A simple 3x3 matrix with equal cell sizes.`]),F(`div`,{className:`hi`},[F(BK,{nf:nn(),nh:[120,120,120],ng:[60,60,60]})]),F(`div`,{className:`hj`},[`data: [\n` + `  { x: 0, y: 0, col: 1, row: 1, text: "A1" },\n` + `  { x: 1, y: 0, col: 1, row: 1, text: "B1" },\n` + `  // ...\n` + `]`])]),F(`div`,{className:`hf`},[F(`h2`,{className:`hg`},[`Merged Cells`]),F(`p`,{className:`hh`},[`Cells can span multiple columns (col) or rows (row).`]),F(`div`,{className:`hi`},[F(BK,{nf:no(),nh:[120,120,120],ng:[60,60,60]})]),F(`div`,{className:`hj`},[`{ x: 0, y: 0, col: 2, row: 1, text: "Merged" }\n` + `{ x: 2, y: 0, col: 1, row: 2, text: "Tall Cell" }\n` + `{ x: 0, y: 2, col: 3, row: 1, text: "Wide Footer" }`])]),F(`div`,{className:`hf`},[F(`h2`,{className:`hg`},[`Table Layout`]),F(`p`,{className:`hh`},[`Use Matrix for table-like data with fixed headers.`]),F(`div`,{className:`hi`},[F(BK,{nf:np(),nh:[150,100,150],ng:[50,45,45,45],ni:true,nj:200})]),F(`div`,{className:`hj`},[`<Matrix\n` + `  data={tableData}\n` + `  fixFirstRow={true}\n` + `  maxHeight={200}\n` + `/>`])]),F(`div`,{className:`hf`},[F(`h2`,{className:`hg`},[`Properties`]),F(`div`,{className:`hj`},[`data: MatrixData           - Grid data with cell definitions\n` + `cellWidth: Array(Number)   - Width for each column\n` + `cellHeight: Array(Number)  - Height for each row\n` + `fixFirstColumn: Bool       - Fix first column on scroll\n` + `fixFirstRow: Bool          - Fix first row on scroll\n` + `maxWidth: Number           - Max width with horizontal scroll\n` + `maxHeight: Number          - Max height with vertical scroll\n` + `width: Number              - Fixed matrix width\n` + `height: Number             - Fixed matrix height`])])])},BM=({nq=[],nr=``,ns=`line`,nt=`#1989fa`,nu=`#fff`,nv=300,nw=`40px`,nx=`3px`,ny=false,nz=false,oa=false,ob=false,oc=false,od=0,oe=5,of=``,og=`#646566`,oh=true,oi=false,oj=(ok)=>{return ck()},ol=(om)=>{return ck()},on=(oo)=>{return ck()},op=(oq)=>{return ck()},or=(os)=>{return true}})=>{const ot=G(``),ou=G(0),ov=G(``),ow=G(false),ox=G(0),oy=G(0),oz=G(0),pa=()=>{((() => {
      setTimeout(() => {
        const tabs = nq;
        const currentActive = ot.value;
        const lineWidth = nw;
        const lineHeight = nx;
        const shrink = oi;

        console.log('updateLinePosition: currentActive =', currentActive);

        const index = tabs.findIndex(tab => tab.name === currentActive);
        console.log('updateLinePosition: index =', index);
        if (index < 0) {
          console.log('updateLinePosition: index < 0, returning');
          return;
        }

        const navElement = document.querySelector('[role="tablist"]');
        console.log('updateLinePosition: navElement =', navElement);
        if (!navElement) {
          console.log('updateLinePosition: no navElement found');
          return;
        }

        const tabElements = navElement.querySelectorAll('[role="tab"]');
        console.log('updateLinePosition: tabElements =', tabElements);
        if (index >= tabElements.length) {
          console.log('updateLinePosition: index >= tabElements.length');
          return;
        }

        const currentTab = tabElements[index];
        if (!currentTab) {
          console.log('updateLinePosition: no currentTab');
          return;
        }

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
        console.log('updateLinePosition: newStyle =', newStyle);
        (()=>{ov.value=(newStyle)})()

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
    })());return ck()},pb=()=>{((() => {
      const sticky = oa;
      if (!sticky) return;

      const offsetTop = od;

      const handleScroll = () => {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        const shouldBeFixed = scrollTop >= offsetTop;

        if (ow.value !== shouldBeFixed) {
          (()=>{ow.value=(shouldBeFixed)})()
          on(m({scrollTop:(scrollTop),isFixed:(shouldBeFixed)}))
        }
      };

      window.addEventListener('scroll', handleScroll, { passive: true });
    })());return ck()},pc=(pd,pe,pf)=>{return (pd.disabled?op(l({name:pd.name,title:pd.title,index:pe,disabled:pd.disabled})):(()=>{ol(l({name:pd.name,title:pd.title,index:pe,disabled:pd.disabled}));(()=>{ot.value=pd.name})();pa();return oj(k({name:pd.name,title:pd.title,index:pe}))})())},pg=(ph)=>{((() => {
      const swipeable = ob;
      if (!swipeable) return;

      const touch = ph.touches[0];
      if (touch) {
        D(()=>{ox.value=(touch.clientX);oy.value=(touch.clientY)})
      }
    })());return ck()},pi=(pj)=>{((() => {
      const swipeable = ob;
      if (!swipeable) return;

      const touch = pj.touches[0];
      if (!touch) return;

      const deltaX = touch.clientX - ox.value;
      const deltaY = touch.clientY - oy.value;

      // If swiping vertically, don't interfere
      if (Math.abs(deltaY) > Math.abs(deltaX)) return;

      // Prevent default scroll when swiping horizontally
      pj.preventDefault();
    })());return ck()},pk=(pl)=>{((() => {
      const swipeable = ob;
      if (!swipeable) return;

      const touch = pl.changedTouches[0];
      if (!touch) return;

      const deltaX = touch.clientX - ox.value;
      const deltaY = touch.clientY - oy.value;

      // Only process horizontal swipes
      if (Math.abs(deltaY) > Math.abs(deltaX)) return;

      const threshold = oe || 5;
      const tabs = nq;
      const currentIndex = tabs.findIndex(tab => tab.name === ot.value);

      if (Math.abs(deltaX) > threshold) {
        if (deltaX > 0 && currentIndex > 0) {
          // Swipe right - go to previous tab
          const prevTab = tabs[currentIndex - 1];
          if (!prevTab.disabled) {
            pc((prevTab),(currentIndex - 1),pl)
          }
        } else if (deltaX < 0 && currentIndex < tabs.length - 1) {
          // Swipe left - go to next tab
          const nextTab = tabs[currentIndex + 1];
          if (!nextTab.disabled) {
            pc((nextTab),(currentIndex + 1),pl)
          }
        }
      }
    })());return ck()},pm=()=>{const _={[`--x-a`]:nu};return _},pn=()=>{const _={};(E(ns,`card`)?Object.assign(_,{[`--ab-a`]:`0 16px`,[`--ab-b`]:`2px`,[`--ab-c`]:`var(--mint-background, #f7f8fa)`}):null);(oi?Object.assign(_,{[`--ab-d`]:`nowrap`}):Object.assign(_,{[`--ab-e`]:`1`}));return _},po=()=>{const _={};(!oi?Object.assign(_,{[`--ac-a`]:`1`}):null);return _},pp=(pq,pr)=>{const _={[`--y-a`]:`all ` + gh(nv) + `ms`};(pq?Object.assign(_,{[`--y-b`]:(bn(of)?nt:of),[`--y-c`]:`500`}):Object.assign(_,{[`--y-b`]:og,[`--y-c`]:`400`}));(pr?Object.assign(_,{[`--y-b`]:`var(--mint-text-color-3, #c8c9cc)`,[`--y-d`]:`not-allowed`}):null);(oi?Object.assign(_,{[`--y-e`]:`0 0 auto`,[`--y-f`]:`0 12px`}):null);(oh?Object.assign(_,{[`--y-g`]:`nowrap`,[`--y-h`]:`hidden`,[`--y-i`]:`ellipsis`}):null);(pq?Object.assign(_,{[`--ad-a`]:`#fff`,[`--ad-b`]:`2px`}):null);return _},ps=()=>{const _={[`--z-a`]:nt,[`--z-b`]:`all ` + gh(nv) + `ms`};return _},pt=()=>{const _={};(ny?Object.assign(_,{[`--ae-a`]:`hidden`}):null);return _},pu=()=>{const _={[`--aa-a`]:`transform ` + gh(nv) + `ms`,[`--aa-b`]:`translateX(` + gh(oz.value) + `%)`};return _};H(()=>{(()=>{((() => {
      (()=>{ot.value=nr})()
      pb()
      pa()
    })());return ck()})()},[]);I(()=>{((() => {
      if (ot.value !== nr) {
        console.log('Tabs: Updating from', ot.value, 'to', nr);
        (()=>{ot.value=nr})()
        setTimeout(() => {
          console.log('Tabs: Calling updateLinePosition');
          pa()
        }, 150);
      }
    })());return ck()});return F(`div`,{},[F(`div`,{className:(oa && ow.value?`containerSticky`:``) + ` id`,style:K([pm()])},[F(`div`,{className:`ie`,style:K([pn()])},[F(`div`,{"role":`tablist`,"onTouchStart":pg,"onTouchMove":pi,"onTouchEnd":pk,className:`ig`,style:K([po()])},[(()=>{const _0=[];const _1=nq;let _i=-1;for(let pv of _1){_i++;const pw=_i;_0.push(F(`div`,{"key":pv.name,"role":`tab`,"onClick":(px)=>{return pc(pv,pw,px)},className:`ih`,style:K([pp(E(pv.name,ot.value),pv.disabled),pv.titleStyle])},[F(`span`,{className:`ii`},[(!bn(pv.icon)?F(`span`,{className:`ij`},[pv.icon]):null),pv.title,(pv.dot?F(`span`,{className:`ik`}):null),(!bn(pv.badge)?F(`span`,{className:`il`},[pv.badge]):null)])]))};return _0})(),(E(ns,`line`)?F(`div`,{className:`im`,style:K([ps(),ov.value])}):null)])])]),(ny?F(`div`,{className:`io`,style:K([pt()])},[F(`div`,{className:`ip`,style:K([pu()])},[(()=>{const _0=[];const _1=nq;let _i=-1;for(let py of _1){_i++;const pz=_i;_0.push(F(`div`,{"key":py.name,className:`iq`},[(!bn(py.content)?F(`div`,{},[py.content]):null)]))};return _0})()])]):null)])},BN=()=>{const qa=G(`tab1`),qb=G(`a`),qc=G(`card1`),qd=G(`badge1`),qe=()=>{return [j({name:`tab1`,title:`Tab 1`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`tab2`,title:`Tab 2`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`tab3`,title:`Tab 3`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`tab4`,title:`Tab 4`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``})]},qf=()=>{return [j({name:`a`,title:`Tab A`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`b`,title:`Tab B`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`c`,title:`Tab C`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``})]},qg=()=>{return [j({name:`badge1`,title:`Tab`,disabled:false,dot:true,badge:``,titleStyle:``,icon:``,content:``}),j({name:`badge2`,title:`Tab`,disabled:false,dot:false,badge:`5`,titleStyle:``,icon:``,content:``}),j({name:`badge3`,title:`Tab`,disabled:false,dot:false,badge:`99+`,titleStyle:``,icon:``,content:``})]},qh=(qi)=>{return (()=>{qa.value=qi.name})()},qj=(qk)=>{return (()=>{qb.value=qk.name})()},ql=(qm)=>{return (()=>{qc.value=qm.name})()},qn=(qo)=>{return (()=>{qd.value=qo.name})()},qp=()=>{return F(`div`,{className:`fh`},[F(`h1`,{className:`fl`,style:K([qq()])},[`Tabs`,F(`span`,{className:`fn`},[`Navigation`])]),F(`p`,{className:`fm`,style:K([qr()])},[`Used to switch between different content areas.`]),F(`div`,{className:`fi`,style:K([qs()])},[F(`div`,{className:`fj`},[`Basic Usage`]),F(BM,{nq:qe(),nr:qa.value,oj:qh}),F(`div`,{className:`fk`},[(E(qa.value,`tab1`)?`Content of Tab 1`:(E(qa.value,`tab2`)?`Content of Tab 2`:(E(qa.value,`tab3`)?`Content of Tab 3`:`Content of Tab 4`)))])]),F(`div`,{className:`fi`,style:K([qs()])},[F(`div`,{className:`fj`},[`Match by name`]),F(BM,{nq:qf(),nr:qb.value,oj:qj}),F(`div`,{className:`fk`},[(E(qb.value,`a`)?`Content of Tab A`:(E(qb.value,`b`)?`Content of Tab B`:`Content of Tab C`))])]),F(`div`,{className:`fi`,style:K([qs()])},[F(`div`,{className:`fj`},[`Card Style`]),F(BM,{nq:qe(),nr:qc.value,ns:`card`,oj:ql}),F(`div`,{className:`fk`},[(E(qc.value,`tab1`)?`Card Style Tab 1`:(E(qc.value,`tab2`)?`Card Style Tab 2`:(E(qc.value,`tab3`)?`Card Style Tab 3`:`Card Style Tab 4`)))])]),F(`div`,{className:`fi`,style:K([qs()])},[F(`div`,{className:`fj`},[`Badge & Dot`]),F(BM,{nq:qg(),nr:qd.value,oj:qn}),F(`div`,{className:`fk`},[(E(qd.value,`badge1`)?`Tab with dot indicator`:(E(qd.value,`badge2`)?`Tab with badge count (5)`:`Tab with 99+ badge`))])])])},qt=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--c-a`]:`0`}):null);return _},qs=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--d-a`]:`16px`,[`--d-b`]:`0`}):null);return _},qq=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--e-a`]:`24px`,[`--e-b`]:`0 0 16px`,[`--e-c`]:`16px`}):null);return _},qr=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--f-a`]:`14px`,[`--f-b`]:`22px`}):null);return _};return F(`div`,{className:`fa`,style:K([qt()])},[(E(ah.value,`mobile`)?F(`div`,{className:`fb`},[F(`div`,{className:`fd`},[F(`div`,{className:`fe`})]),F(`div`,{className:`ff`},[qp()])]):F(`div`,{className:`fb fc`},[F(`div`,{className:`ff fg`},[qp()])]))])},BO=({qu=h({name:``,tel:``,province:``,city:``,county:``,addressDetail:``,areaCode:``,isDefault:false}),qv=[],qw=false,qx=false,qy=false,qz=true,ra=true,rb=false,rc=`Save`,rd=`Delete`,re=1,rf=200,rg=20,rh=false,ri=false,rj=`Area`,rk=`Name`,rl=`Phone`,rm=`Detailed Address`,rn=(ro)=>{return u(null)},rp=(rq)=>{return u(null)},rr=(rs,rt)=>{return u(null)},ru=(rv)=>{return u(null)},rw=(rx)=>{return u(null)},ry=(rz)=>{return u(null)},sa=(sb)=>{return u(null)},sc=()=>{return u(null)},sd=(se)=>{return true},sf=(sg,sh)=>{return ``},si=null,sj=[`Choose`,`Choose`,`Choose`]})=>{const sk=G(``),sl=G(``),sm=G(``),sn=G(``),so=G(``),sp=G(``),sq=G(``),sr=G(false),ss=G(false),st=G(``),su=G(``),sv=G(``),sw=G(``),sx=(sy)=>{D(()=>{sk.value=sy;st.value=``});return rr(`name`,sy)},sz=(ta)=>{D(()=>{sl.value=ta;su.value=``});return rr(`tel`,ta)},tb=(tc)=>{D(()=>{sp.value=tc;sw.value=``});return ru(tc)},td=(te)=>{return sa(`name`)},tf=(tg)=>{return sa(`tel`)},th=(ti)=>{return sa(`addressDetail`)},tj=(tk)=>{((() => {
      const value = event.target.value || "";
      sx((value))
    })());return u(null)},tl=(tm)=>{((() => {
      const value = event.target.value || "";
      sz((value))
    })());return u(null)},tn=(to)=>{((() => {
      const value = event.target.value || "";
      tb((value))
    })());return u(null)},tp=(tq)=>{((() => {
      const newValue = !sr.value;
      tr((newValue))
    })());return u(null)},tr=(ts)=>{(()=>{sr.value=ts})();return rw(ts)},tt=(tu)=>{return (!rb?(()=>{(()=>{ss.value=true})();return sc()})():u(null))},tv=()=>{return (()=>{st.value=`Please fill in the name`})()},tw=(tx)=>{return (()=>{st.value=tx})()},ty=(tz)=>{return (()=>{su.value=tz})()},ua=()=>{return (()=>{sv.value=`Please select area`})()},ub=()=>{return (()=>{sw.value=`Please fill in the address`})()},uc=()=>{return D(()=>{st.value=``;su.value=``;sv.value=``;sw.value=``})},ud=()=>{return h({name:sk.value,tel:sl.value,province:sm.value,city:sn.value,county:so.value,addressDetail:sp.value,areaCode:sq.value,isDefault:sr.value})},ue=()=>{((() => {
      const nameValidationError = sf(`name`,sk.value);
      const telValidationError = sf(`tel`,sl.value);
      const telValid = sd(sl.value);

      if (bn(sk.value)) {
        tv()
      } else if (nameValidationError) {
        tw((nameValidationError))
      } else if (bn(sl.value)) {
        ty(`Please fill in the phone`)
      } else if (!telValid) {
        ty(`Invalid phone number`)
      } else if (telValidationError) {
        ty((telValidationError))
      } else if (qz && bn(sq.value)) {
        ua()
      } else if (ra && bn(sp.value)) {
        ub()
      } else {
        rn(ud())
      }
    })());return u(null)},uf=(ug)=>{(event.preventDefault());uc();return ue()},uh=(ui)=>{(event.preventDefault());return rp(ud())},uj=(uk)=>{(()=>{sp.value=uk.address})();return ry(uk)},ul=()=>{return (bp(sm.value) && bp(sn.value) && bp(so.value)?sm.value + ` ` + sn.value + ` ` + so.value:(bp(sq.value)?`Selected`:``))};H(()=>{(()=>{return D(()=>{sk.value=qu.name;sl.value=qu.tel;sm.value=qu.province;sn.value=qu.city;so.value=qu.county;sp.value=qu.addressDetail;sq.value=qu.areaCode;sr.value=qu.isDefault})})()},[]);return F(`div`,{className:`cz`},[F(`form`,{"onSubmit":uf,className:`da`},[F(`div`,{className:`db`},[F(`div`,{className:`dc`},[F(`div`,{className:`dd`},[`Name`]),F(`div`,{className:`de`},[F(`input`,{"type":`text`,"value":sk.value,"placeholder":rk,"onFocus":td,"onChange":tj,className:`df`})])]),(bp(st.value)?F(`div`,{className:`dj`},[st.value]):null),F(`div`,{className:`dc`},[F(`div`,{className:`dd`},[`Phone`]),F(`div`,{className:`de`},[F(`input`,{"type":`tel`,"value":sl.value,"placeholder":rl,"maxlength":gh(rg),"onFocus":tf,"onChange":tl,className:`df`})])]),(bp(su.value)?F(`div`,{className:`dj`},[su.value]):null),(qz?(()=>{F(`div`,{"onClick":tt,className:`dc`},[F(`div`,{className:`dd`},[`Area`]),F(`div`,{className:`de`},[F(`input`,{"type":`text`,"value":ul(),"placeholder":rj,readOnly:true,"disabled":rb,className:`df`}),F(`span`,{className:`dk`},[`›`])])]);return (bp(sv.value)?F(`div`,{className:`dj`},[sv.value]):null)})():null)]),(ra?(()=>{F(`div`,{className:`dg`},[F(`div`,{className:`dh`},[`Detailed Address`]),F(`textarea`,{"value":sp.value,"placeholder":rm,"rows":gh(re),"maxlength":gh(rf),"onFocus":th,"onChange":tn,className:`di`})]);return (bp(sw.value)?F(`div`,{className:`dj`},[sw.value]):null)})():null),si,(qy && fv(qv) > 0?F(`div`,{className:`du`},[(()=>{const _0=[];const _1=qv;let _i=-1;for(let um of _1){_i++;_0.push(F(`div`,{"onClick":(un)=>{return uj(um)},className:`dv`},[F(`div`,{className:`dw`},[um.name]),F(`div`,{className:`dx`},[um.address])]))};return _0})()]):null),(qx?F(`div`,{className:`dl`},[F(`span`,{className:`dm`},[`Set as the default address`]),F(`div`,{"onClick":tp,className:(sr.value?`switchOn`:``) + ` dn`},[F(`div`,{className:(sr.value?`switchNodeOn`:``) + ` dp`})])]):null),F(`div`,{className:`dq`},[F(`button`,{"type":`submit`,"disabled":rh,className:`dr ds`},[(rh?F(`div`,{className:`dy`}):null),F(`span`,{},[rc])]),(qw?F(`button`,{"type":`button`,"disabled":ri,"onClick":uh,className:`dr dt`},[(ri?F(`div`,{className:`dy dz`}):null),F(`span`,{},[rd])]):null)])])])},BP=()=>{const uo=G([]),up=G(h({name:`John Doe`,tel:`+1 234-567-8900`,province:`California`,city:`Los Angeles`,county:`Los Angeles County`,addressDetail:`123 Main Street, Apt 4B, Building A`,areaCode:`90001`,isDefault:true})),uq=G(h({name:``,tel:``,province:``,city:``,county:``,addressDetail:``,areaCode:``,isDefault:false})),ur=G(false),us=G(``),ut=G(`filled`),uu=()=>{return (()=>{ur.value=false})()},uv=(uw)=>{return D(()=>{ur.value=true;us.value=uw})},ux=(uy)=>{((() => {
      uv(uy)

      setTimeout(() => {
        uu()
      }, 2000);
    })());return u(null)},uz=(va)=>{return ux(`Address saved!`)},vb=(vc)=>{return ux(`Address deleted!`)},vd=(ve,vf)=>{return u(null)},vg=(vh)=>{return (bp(vh)?(()=>{uo.value=[i({name:`Home`,address:`123 Main Street, Apt 4B`}),i({name:`Work`,address:`456 Business Ave, Suite 100`})]})():(()=>{uo.value=[]})())},vi=(vj)=>{return u(null)},vk=(vl)=>{(()=>{uo.value=[]})();return ux(`Selected: ` + vl.name)},vm=(vn)=>{return (()=>{ut.value=`filled`})()},vo=(vp)=>{return (()=>{ut.value=`empty`})()},vq=()=>{return (E(ut.value,`filled`)?up.value:uq.value)};return F(`div`,{className:`ea`},[F(`div`,{className:`eb`},[F(`h1`,{className:`ec`},[`📍 AddressEdit`]),F(`p`,{className:`ed`},[`Create, update, and delete receiving addresses with validation and search functionality`])]),F(`div`,{className:`ee`},[F(`div`,{className:`ef`},[F(`h2`,{className:`eg`},[`📱 Basic Usage`,F(`span`,{className:`eh`},[`Mobile`])]),F(`div`,{className:`ey`},[F(`button`,{"onClick":vm,className:(E(ut.value,`filled`)?`tabButtonActive`:``) + ` ez`},[`With Data`]),F(`button`,{"onClick":vo,className:(E(ut.value,`empty`)?`tabButtonActive`:``) + ` ez`},[`Empty Form`])]),F(`div`,{className:`ei`},[(E(ah.value,`mobile`)?F(`div`,{className:`ej`},[F(`div`,{className:`el`},[F(`div`,{className:`em`})]),F(`div`,{className:`en`},[F(BO,{qu:vq(),qv:uo.value,qw:true,qx:true,qy:fv(uo.value) > 0,qz:true,ra:true,rk:`Name`,rl:`Phone`,rj:`Area`,rm:`Address`,rc:`Save Address`,rd:`Delete Address`,rn:uz,rp:vb,rr:vd,ru:vg,rw:vi,ry:vk})])]):F(`div`,{className:`ej ek`},[F(`div`,{className:`en eo`},[F(BO,{qu:vq(),qv:uo.value,qw:true,qx:true,qy:fv(uo.value) > 0,qz:true,ra:true,rk:`Name`,rl:`Phone`,rj:`Area`,rm:`Address`,rc:`Save Address`,rd:`Delete Address`,rn:uz,rp:vb,rr:vd,ru:vg,rw:vi,ry:vk})])]))]),F(`div`,{className:`ex`},[(E(ah.value,`mobile`)?`💡 Mobile view: Switch between 'With Data' and 'Empty Form' to see different states. Try typing in the 'Address' field to see search suggestions. Use the navbar toggle to switch to Desktop view.`:`💡 Desktop view: This shows how the component looks on larger screens. Switch to Mobile view using the navbar toggle to see the mobile-optimized design.`)]),F(`div`,{className:`ep`},[`<AddressEdit\n`,`  addressInfo={addressInfo}\n`,`  searchResult={searchResult}\n`,`  showDelete={true}\n`,`  showSetDefault={true}\n`,`  showSearchResult={true}\n`,`  onSave={handleSave}\n`,`  onDelete={handleDelete}\n`,`  onChangeDetail={handleChangeDetail}/>`])]),F(`div`,{className:`ef`},[F(`h2`,{className:`eg`},[`📋 Props`]),F(`table`,{className:`eq`},[F(`thead`,{className:`er`},[F(`tr`,{},[F(`th`,{className:`es`},[`Attribute`]),F(`th`,{className:`es`},[`Description`]),F(`th`,{className:`es`},[`Type`]),F(`th`,{className:`es`},[`Default`])])]),F(`tbody`,{},[F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`addressInfo`]),F(`td`,{className:`eu`},[`Address information object`]),F(`td`,{className:`ev`},[`AddressEditInfo`]),F(`td`,{className:`ev`},[`{}`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`searchResult`]),F(`td`,{className:`eu`},[`Address search results`]),F(`td`,{className:`ev`},[`Array(AddressEditSearchItem)`]),F(`td`,{className:`ev`},[`[]`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`showDelete`]),F(`td`,{className:`eu`},[`Whether to show delete button`]),F(`td`,{className:`ev`},[`Bool`]),F(`td`,{className:`ev`},[`false`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`showSetDefault`]),F(`td`,{className:`eu`},[`Whether to show default address switch`]),F(`td`,{className:`ev`},[`Bool`]),F(`td`,{className:`ev`},[`false`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`showSearchResult`]),F(`td`,{className:`eu`},[`Whether to show search results`]),F(`td`,{className:`ev`},[`Bool`]),F(`td`,{className:`ev`},[`false`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`showArea`]),F(`td`,{className:`eu`},[`Whether to show area field`]),F(`td`,{className:`ev`},[`Bool`]),F(`td`,{className:`ev`},[`true`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`showDetail`]),F(`td`,{className:`eu`},[`Whether to show detail field`]),F(`td`,{className:`ev`},[`Bool`]),F(`td`,{className:`ev`},[`true`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`disableArea`]),F(`td`,{className:`eu`},[`Whether to disable area select`]),F(`td`,{className:`ev`},[`Bool`]),F(`td`,{className:`ev`},[`false`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`isSaving`]),F(`td`,{className:`eu`},[`Show save button loading status`]),F(`td`,{className:`ev`},[`Bool`]),F(`td`,{className:`ev`},[`false`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`isDeleting`]),F(`td`,{className:`eu`},[`Show delete button loading status`]),F(`td`,{className:`ev`},[`Bool`]),F(`td`,{className:`ev`},[`false`])])])])]),F(`div`,{className:`ef`},[F(`h2`,{className:`eg`},[`⚡ Events`]),F(`table`,{className:`eq`},[F(`thead`,{className:`er`},[F(`tr`,{},[F(`th`,{className:`es`},[`Event`]),F(`th`,{className:`es`},[`Description`]),F(`th`,{className:`es`},[`Arguments`])])]),F(`tbody`,{},[F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`onSave`]),F(`td`,{className:`eu`},[`Emitted when save button is clicked`]),F(`td`,{className:`ev`},[`info: AddressEditInfo`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`onDelete`]),F(`td`,{className:`eu`},[`Emitted when delete is confirmed`]),F(`td`,{className:`ev`},[`info: AddressEditInfo`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`onChange`]),F(`td`,{className:`eu`},[`Emitted when name or tel field changes`]),F(`td`,{className:`ev`},[`key: String, value: String`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`onChangeDetail`]),F(`td`,{className:`eu`},[`Emitted when address detail changes`]),F(`td`,{className:`ev`},[`value: String`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`onChangeDefault`]),F(`td`,{className:`eu`},[`Emitted when switching default address`]),F(`td`,{className:`ev`},[`checked: Bool`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`onSelectSearch`]),F(`td`,{className:`eu`},[`Emitted when search result is selected`]),F(`td`,{className:`ev`},[`item: AddressEditSearchItem`])])])])]),F(`div`,{className:`ef`},[F(`h2`,{className:`eg`},[`📦 Types`]),F(`div`,{className:`ep`},[`type AddressEditInfo {\n`,`  name: String,\n`,`  tel: String,\n`,`  province: String,\n`,`  city: String,\n`,`  county: String,\n`,`  addressDetail: String,\n`,`  areaCode: String,\n`,`  isDefault: Bool\n`,`}\n\n`,`type AddressEditSearchItem {\n`,`  name: String,\n`,`  address: String\n`,`}`])]),F(`div`,{className:`ef`},[F(`h2`,{className:`eg`},[`🎨 CSS Variables`]),F(`table`,{className:`eq`},[F(`thead`,{className:`er`},[F(`tr`,{},[F(`th`,{className:`es`},[`Name`]),F(`th`,{className:`es`},[`Default Value`]),F(`th`,{className:`es`},[`Description`])])]),F(`tbody`,{},[F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`--mint-address-edit-padding`]),F(`td`,{className:`ev`},[`var(--mint-padding-sm, 12px)`]),F(`td`,{className:`eu`},[`Form fields padding`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`--mint-address-edit-buttons-padding`]),F(`td`,{className:`ev`},[`16px 16px`]),F(`td`,{className:`eu`},[`Buttons container padding`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`--mint-address-edit-button-margin-bottom`]),F(`td`,{className:`ev`},[`12px`]),F(`td`,{className:`eu`},[`Button margin bottom`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`--mint-address-edit-button-font-size`]),F(`td`,{className:`ev`},[`var(--mint-font-size-lg, 16px)`]),F(`td`,{className:`eu`},[`Button font size`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`--mint-primary-color`]),F(`td`,{className:`ev`},[`#1989fa`]),F(`td`,{className:`eu`},[`Primary color for buttons and switch`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`--mint-danger-color`]),F(`td`,{className:`ev`},[`#ee0a24`]),F(`td`,{className:`eu`},[`Danger color for delete and errors`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`--mint-background`]),F(`td`,{className:`ev`},[`#f7f8fa`]),F(`td`,{className:`eu`},[`Background color`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`--mint-border-color`]),F(`td`,{className:`ev`},[`#ebedf0`]),F(`td`,{className:`eu`},[`Border color`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`--mint-text-color`]),F(`td`,{className:`ev`},[`#323233`]),F(`td`,{className:`eu`},[`Primary text color`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`--mint-text-color-2`]),F(`td`,{className:`ev`},[`#969799`]),F(`td`,{className:`eu`},[`Secondary text color`])]),F(`tr`,{className:`et`},[F(`td`,{className:`ev`},[`--mint-text-color-3`]),F(`td`,{className:`ev`},[`#c8c9cc`]),F(`td`,{className:`eu`},[`Placeholder text color`])])])])])]),(ur.value?F(`div`,{className:`ew`},[us.value]):null)])},vr=()=>{return null},vs=(vt,vu)=>{return (vt.filter(vu))},vv=(vw,vx)=>{return ((() => {
      for (let item of vw) {
        if (E(vx, item)) {
          return true
        }
      }

      return false
    })())},vy=(vz,wa)=>{return (vz.split(wa))},wb=(wc)=>{return (wc.length)},wd=(we,wf)=>{return (Math.min(we, wf))},wg=(wh,wi)=>{return (Math.max(wh, wi))},wj=(wk,wl,wm)=>{return wd(wm,wg(wl,wk))},wn=(wo,wp)=>{return (wo.slice(wj(0,wp,wb(wo))))},wq=(wr,ws)=>{return (wr.startsWith(ws))},wt=(wu,wv,ww)=>{return (ww >= wb(wu)?P(S)(wu):(()=>{const wx=(wu.substring(ww, ww + 1));return (E(wx,wv)?P(S)((wu.substring(0, ww + 1))):wt(wu,wv,ww + 1))})())},wy=(wz)=>{return (wq(wz,`"`)?wt(wz,`"`,1):(wq(wz,`'`)?wt(wz,`'`,1):new T()))},xa=(xb,xc,xd)=>{return (xb.replace(xc, xd))},xe=(xf)=>{return xa(xa(xa(xf,`&`,`&amp;`),`<`,`&lt;`),`>`,`&gt;`)},xg=(xh,xi)=>{return `<span style='color: ` + xi + `;'>` + xe(xh) + `</span>`},xj=(xk)=>{return (bn(xk)?false:((() => { const c = xk.charCodeAt(0); return (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122) || c === 95; })()))},xl=(xm,xn)=>{return (xn >= wb(xm)?P(S)((xm.substring(0, xn))):(()=>{const xo=(xm.substring(xn, xn + 1));return (xj(xo)?xl(xm,xn + 1):P(S)((xm.substring(0, xn))))})())},xp=(xq)=>{const xr=(xq.substring(0, 1));return (xj(xr)?xl(xq,1):new T())},xs=(xt,xu)=>{return Q((()=>{const _0=[];const _1=xt;let _i=-1;for(let xv of _1){_i++;const _2=xu(xv);if(!_2){continue};_0.push(xv)};return _0})(),0,S,T)},xw=(xx,xy)=>{return !E(xs(xx,xy),new T())},xz=(ya,yb)=>{return xw(ya,(yc)=>{return E(yc,yb)})},yd=(ye,yf,yg,yh,yi)=>{return (yh >= wb(ye)?yi:(()=>{const yj=wn(ye,yh);return M(wy(yj),[[N(S,[O]),(yk)=>{return (()=>{const yl=wb(yk);const ym=xg(yk,`#CE9178`);return yd(ye,yf,yg,yh + yl,yi + ym)})()}],[N(T,[]),()=>{return M(xp(yj),[[N(S,[O]),(yn)=>{return (()=>{const yo=wb(yn);const yp=(xz(yf,yn)?xg(yn,`#C586C0`):(xz(yg,yn)?xg(yn,`#4EC9B0`):xg(yn,`#9CDCFE`)));return yd(ye,yf,yg,yh + yo,yi + yp)})()}],[N(T,[]),()=>{return (()=>{const yq=(yj.substring(0, 1));const yr=xg(yq,`#D4D4D4`);return yd(ye,yf,yg,yh + 1,yi + yr)})()}]])}]])})())},ys=(yt,yu,yv)=>{return yd(yt,yu,yv,0,``)},yw=(yx,yy,yz,za,zb)=>{return (za >= fv(yx)?zb:M(ge(yx,za),[[N(S,[O]),(zc)=>{return (()=>{const zd=ys(zc,yy,yz);const ze=(za < fv(yx) - 1?zd + `\n`:zd);return yw(yx,yy,yz,za + 1,zb + ze)})()}],[N(T,[]),()=>{return yw(yx,yy,yz,za + 1,zb)}]]))},zf=(zg,zh,zi)=>{const zj=vy(zg,`\n`);return yw(zj,zh,zi,0,``)},zk=(zl)=>{return zf(zl,[`module`,`component`,`fun`,`property`,`state`,`const`,`if`,`else`,`case`,`for`,`of`,`do`,`next`,`let`,`try`,`catch`,`where`,`return`,`await`,`encode`,`decode`,`style`,`connect`,`exposing`,`use`,`provider`,`subscription`,`sequence`],[`String`,`Number`,`Bool`,`Array`,`Maybe`,`Result`,`Promise`,`Html`,`Void`,`Time`,`Tuple`])},zm=(zn)=>{return zf(zn,[`import`,`from`,`to`,`important`,`media`,`keyframes`,`and`,`not`,`only`],[`color`,`background`,`background-color`,`border`,`border-radius`,`margin`,`padding`,`width`,`height`,`display`,`position`,`top`,`right`,`bottom`,`left`,`flex`,`grid`,`font`,`font-size`,`font-weight`,`opacity`,`transform`,`transition`,`animation`,`animation-name`,`animation-duration`,`animation-timing-function`,`animation-delay`,`animation-fill-mode`])},BQ=({zo=``,zp=`mint`,zq=false})=>{const zr=()=>{return (navigator.clipboard.writeText(zo))},zs=()=>{return (E(zp,`mint`)?zk(zo):(E(zp,`css`)?zm(zo):xe(zo)))};return F(`div`,{className:`ib`},[(zq?F(`button`,{"onClick":(zt)=>{return zr()},className:`ic`},[`📋 Copy`]):null),F(`div`,{"dangerouslySetInnerHTML":({__html: zs()})})])},zu=(zv)=>{return E(fv(zv),0)},BR=({zw=`Component`,zx=``,zy=`Component`,zz=vr(),aaa=vr(),aab=vr(),aac=false,aad=``,aae=r({code:``,language:`mint`}),aaf=[],aag=[],aah=vr(),aai=[],aaj=[],aak=[],aal=[`preview`,`usage`,`api`],aam=``,aan=`localhost:3000`})=>{const aao=G(`preview`),aap=()=>{const aaq=[j({name:`preview`,title:`Preview`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`usage`,title:`Usage`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`api`,title:`API`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``})];return vs(aaq,(aar)=>{return vv(aal,aar.name)})},aas=(aat)=>{return (()=>{aao.value=aat.name})()};return F(`div`,{className:`ir`},[F(`h1`,{className:`is`},[zw,F(`span`,{className:`iu`},[zy])]),F(`p`,{className:`it`},[zx]),F(BM,{nq:aap(),nr:aao.value,ns:`line`,nt:`#1989fa`,of:`#1989fa`,og:`#646566`,nz:true,nw:`60px`,nx:`3px`,nv:200,oj:aas}),(E(aao.value,`preview`)?F(`div`,{},[zz,(aac?F(`div`,{className:`iv`},[F(`div`,{className:`ja`},[aaa]),F(`div`,{className:`jb`},[aab])]):F(`div`,{className:`iv`},[(E(ah.value,`mobile`)?F(`div`,{className:`iw`},[F(`div`,{className:`ix`},[F(`div`,{className:`iy`})]),F(`div`,{className:`iz`},[F(`div`,{className:`ja`},[aaa]),F(`div`,{className:`jb`},[aab])])]):F(`div`,{className:`iw jc`},[F(`div`,{className:`jd`},[F(`div`,{className:`je jf`}),F(`div`,{className:`je jg`}),F(`div`,{className:`je jh`}),F(`div`,{className:`ji`},[`🔒 ` + (bn(aan)?`localhost:3000`:aan)])]),F(`div`,{className:`iz jj`},[F(`div`,{className:`jk`},[aaa]),F(`div`,{className:`jl`},[aab])])]))]))]):(E(aao.value,`usage`)?F(`div`,{},[(!bn(aad)?F(`div`,{className:`jm`},[F(`h3`,{className:`jn`},[`Usage`]),F(`p`,{className:`jo`},[aad])]):null),(!bn(aae.code)?F(`div`,{className:`jt`},[F(`div`,{className:`ju`},[F(`h3`,{className:`jv`},[`Code Example`])]),F(BQ,{zo:aae.code,zp:aae.language,zq:true})]):null),(()=>{const _0=[];const _1=aaf;let _i=-1;for(let aau of _1){_i++;_0.push(F(`div`,{className:`jt`},[F(`div`,{className:`ju`},[F(`div`,{},[F(`h3`,{className:`jv`},[aau.title]),(!bn(aau.description)?F(`p`,{className:`jw`},[aau.description]):null)])]),F(BQ,{zo:aau.snippet.code,zp:aau.snippet.language,zq:true})]))};return _0})(),aah]):(E(aao.value,`api`)?F(`div`,{},[(!zu(aag)?F(`div`,{className:`jm`},[F(`h3`,{className:`jn`},[`Props`]),F(`table`,{className:`jp`},[F(`thead`,{},[F(`tr`,{},[F(`th`,{className:`jq`},[`Property`]),F(`th`,{className:`jq`},[`Description`]),F(`th`,{className:`jq`},[`Type`]),F(`th`,{className:`jq`},[`Default`])])]),F(`tbody`,{},[(()=>{const _0=[];const _1=aag;let _i=-1;for(let aav of _1){_i++;_0.push(F(`tr`,{},[F(`td`,{className:`jr`},[F(`code`,{className:`js`},[aav.name])]),F(`td`,{className:`jr`},[aav.description]),F(`td`,{className:`jr`},[aav.type]),F(`td`,{className:`jr`},[aav.defaultValue])]))};return _0})()])])]):null),(!zu(aai)?F(`div`,{className:`jm`},[F(`h3`,{className:`jn`},[`Events`]),F(`table`,{className:`jp`},[F(`thead`,{},[F(`tr`,{},[F(`th`,{className:`jq`},[`Event`]),F(`th`,{className:`jq`},[`Description`]),F(`th`,{className:`jq`},[`Arguments`]),F(`th`,{className:`jq`},[`Type`])])]),F(`tbody`,{},[(()=>{const _0=[];const _1=aai;let _i=-1;for(let aaw of _1){_i++;_0.push(F(`tr`,{},[F(`td`,{className:`jr`},[F(`code`,{className:`js`},[aaw.name])]),F(`td`,{className:`jr`},[aaw.description]),F(`td`,{className:`jr`},[aaw.type]),F(`td`,{className:`jr`},[aaw.defaultValue])]))};return _0})()])])]):null),(!zu(aaj)?F(`div`,{className:`jm`},[F(`h3`,{className:`jn`},[`Methods`]),F(`table`,{className:`jp`},[F(`thead`,{},[F(`tr`,{},[F(`th`,{className:`jq`},[`Method`]),F(`th`,{className:`jq`},[`Description`]),F(`th`,{className:`jq`},[`Parameters`]),F(`th`,{className:`jq`},[`Returns`])])]),F(`tbody`,{},[(()=>{const _0=[];const _1=aaj;let _i=-1;for(let aax of _1){_i++;_0.push(F(`tr`,{},[F(`td`,{className:`jr`},[F(`code`,{className:`js`},[aax.name])]),F(`td`,{className:`jr`},[aax.description]),F(`td`,{className:`jr`},[aax.type]),F(`td`,{className:`jr`},[aax.defaultValue])]))};return _0})()])])]):null),(!zu(aak)?F(`div`,{className:`jm`},[F(`h3`,{className:`jn`},[`Slots`]),F(`table`,{className:`jp`},[F(`thead`,{},[F(`tr`,{},[F(`th`,{className:`jq`},[`Slot`]),F(`th`,{className:`jq`},[`Description`]),F(`th`,{className:`jq`},[`Type`]),F(`th`,{className:`jq`},[`Default`])])]),F(`tbody`,{},[(()=>{const _0=[];const _1=aak;let _i=-1;for(let aay of _1){_i++;_0.push(F(`tr`,{},[F(`td`,{className:`jr`},[F(`code`,{className:`js`},[aay.name])]),F(`td`,{className:`jr`},[aay.description]),F(`td`,{className:`jr`},[aay.type]),F(`td`,{className:`jr`},[aay.defaultValue])]))};return _0})()])])]):null),aah]):F(`div`,{},[aah]))))])},BS=({aaz=`fadeIn`,aba=0.6,abb=`ease-out`,abc=0,abd=vr()})=>{const abe=()=>{const _={[`--w-a`]:aaz,[`--w-b`]:gh(aba) + `s`,[`--w-c`]:abb,[`--w-d`]:gh(abc) + `s`};return _};return F(J,{},[F(`div`,{className:`hs`,style:K([`display:none;`])}),F(`div`,{className:`ht`,style:K([`display:none;`])}),F(`div`,{className:`hu`,style:K([`display:none;`])}),F(`div`,{className:`hv`,style:K([`display:none;`])}),F(`div`,{className:`hw`,style:K([`display:none;`])}),F(`div`,{className:`hx`,style:K([`display:none;`])}),F(`div`,{className:`hy`,style:K([`display:none;`])}),F(`div`,{className:`hz`,style:K([`display:none;`])}),F(`div`,{className:`ia`,style:K([abe()])},[abd])])},abf=(abg)=>{return ((() => {
      if (abg.trim() === '') {
        return new T()
      }

      const value = Number(abg)

      if (Number.isNaN(value)) {
        return new T()
      }

      return P(S)((value))
    })())},abh=(abi)=>{return ((() => {
      let value = abi.value

      if (typeof value === "string") {
        return value
      } else {
        return ""
      }
    })())},BT=()=>{const abj=G(`fadeIn`),abk=G(0.6),abl=G(0),abm=G(`ease-out`),abn=G(0),abo=()=>{return [p({id:`fadeIn`,label:`Fade In`,code:`opacity: 0 → 1`}),p({id:`fadeInUp`,label:`Fade In Up`,code:`opacity: 0, translateY(30px) → opacity: 1, translateY(0)`}),p({id:`fadeInDown`,label:`Fade In Down`,code:`opacity: 0, translateY(-30px) → opacity: 1, translateY(0)`}),p({id:`slideInRight`,label:`Slide In Right`,code:`translateX(30px) → translateX(0)`}),p({id:`slideInLeft`,label:`Slide In Left`,code:`translateX(-30px) → translateX(0)`}),p({id:`scaleIn`,label:`Scale In`,code:`scale(0.9) → scale(1)`}),p({id:`zoomIn`,label:`Zoom In`,code:`scale(0) → scale(1)`}),p({id:`rotateIn`,label:`Rotate In`,code:`rotate(-180deg) → rotate(0)`})]},abp=(abq)=>{return D(()=>{abj.value=abq;abn.value=abn.value + 1})},abr=()=>{return (()=>{abn.value=abn.value + 1})()},abs=(abt)=>{return (()=>{abk.value=fx(abf(abt),0.6)})()},abu=(abv)=>{return (()=>{abl.value=fx(abf(abv),0)})()},abw=(abx)=>{return (()=>{abm.value=abx})()},aby=()=>{return F(BS,{aaz:abj.value,aba:abk.value,abb:abm.value,abc:abl.value,"key":gh(abn.value),abd:F(`div`,{className:`jx`},[`Preview`])})},abz=(aca)=>{return fx(ga(xs(abo(),(acb)=>{return E(acb.id,aca)}),(acc)=>{return acc.label}),`Unknown`)},acd=()=>{return F(`div`,{},[F(`h3`,{className:`jy`},[`Animation Controls`]),F(`div`,{className:`jz`},[`Active: `,F(`strong`,{},[abz(abj.value)])]),F(`div`,{className:`ka`},[F(`label`,{className:`kb`},[`Duration`,F(`span`,{className:`kc`},[gh(abk.value) + `s`])]),F(`input`,{"type":`range`,"min":`0.1`,"max":`3`,"step":`0.1`,"value":gh(abk.value),"onInput":(ace)=>{return abs(abh(ace.target))},className:`kd`})]),F(`div`,{className:`ka`},[F(`label`,{className:`kb`},[`Delay`,F(`span`,{className:`kc`},[gh(abl.value) + `s`])]),F(`input`,{"type":`range`,"min":`0`,"max":`2`,"step":`0.1`,"value":gh(abl.value),"onInput":(acf)=>{return abu(abh(acf.target))},className:`kd`})]),F(`div`,{className:`ka`},[F(`label`,{className:`kb`},[`Easing Function`]),F(`select`,{"value":abm.value,"onChange":(acg)=>{return abw(abh(acg.target))},className:`ke`},[F(`option`,{"value":`ease-out`},[`ease-out (recommended)`]),F(`option`,{"value":`ease-in`},[`ease-in`]),F(`option`,{"value":`ease-in-out`},[`ease-in-out`]),F(`option`,{"value":`linear`},[`linear`]),F(`option`,{"value":`cubic-bezier(0.4, 0, 0.2, 1)`},[`cubic-bezier: smooth`]),F(`option`,{"value":`cubic-bezier(0.34, 1.56, 0.64, 1)`},[`cubic-bezier: bouncy ⭐`]),F(`option`,{"value":`cubic-bezier(0.68, -0.55, 0.265, 1.55)`},[`cubic-bezier: back`]),F(`option`,{"value":`cubic-bezier(0.175, 0.885, 0.32, 1.275)`},[`cubic-bezier: anticipate`])])]),F(`button`,{"onClick":(ach)=>{return abr()},className:`kf`},[`▶ Replay Animation`])])},aci=()=>{return [s({title:`Basic Usage`,description:`Simple fade-in animation with default settings`,snippet:r({code:`<EnterExit\n` + `  animation="fadeIn"\n` + `  duration={0.6}\n` + `  content={\n` + `    <div>"Hello World"</div>\n` + `  }/>`,language:`mint`})}),s({title:`With Replay Control`,description:`Use the key prop to trigger animation replay`,snippet:r({code:`component MyPage {\n` + `  state key : Number = 0\n\n` + `  fun replay : Promise(Void) {\n` + `    next { key: key + 1 }\n` + `  }\n\n` + `  fun render : Html {\n` + `    <>\n` + `      <EnterExit\n` + `        animation="${abj.value}"\n` + `        duration={${gh(abk.value)}}\n` + `        easing="${abm.value}"\n` + `        delay={${gh(abl.value)}}\n` + `        key={Number.toString(key)}\n` + `        content={\n` + `          <div>"Your content here"</div>\n` + `        }/>\n\n` + `      <button onClick={(e) { replay() }}>"Replay"</button>\n` + `    </>\n` + `  }\n` + `}`,language:`mint`})}),s({title:`Advanced: Multiple Elements`,description:`Stagger animations with different delays`,snippet:r({code:`<div>\n` + `  <EnterExit\n` + `    animation="fadeInUp"\n` + `    duration={0.5}\n` + `    delay={0}\n` + `    content={<h1>"Title"</h1>}/>\n\n` + `  <EnterExit\n` + `    animation="fadeInUp"\n` + `    duration={0.5}\n` + `    delay={0.2}\n` + `    content={<p>"Subtitle"</p>}/>\n\n` + `  <EnterExit\n` + `    animation="fadeInUp"\n` + `    duration={0.5}\n` + `    delay={0.4}\n` + `    content={<button>"Action"</button>}/>\n` + `</div>`,language:`mint`})}),s({title:`Custom Timing Function`,description:`Use cubic-bezier for smooth custom easing`,snippet:r({code:`<EnterExit\n` + `  animation="scaleIn"\n` + `  duration={0.8}\n` + `  easing="cubic-bezier(0.34, 1.56, 0.64, 1)"\n` + `  content={\n` + `    <div class="card">"Bouncy animation"</div>\n` + `  }/>`,language:`mint`})})]},acj=()=>{return [q({name:`animation`,description:`Animation type to apply. Available: fadeIn, fadeInUp, fadeInDown, slideInRight, slideInLeft, scaleIn, zoomIn, rotateIn`,type:`String`,defaultValue:`"fadeIn"`}),q({name:`duration`,description:`Animation duration in seconds`,type:`Number`,defaultValue:`0.6`}),q({name:`easing`,description:`CSS timing function. Available: ease-out, ease-in, ease-in-out, linear, or any cubic-bezier()`,type:`String`,defaultValue:`"ease-out"`}),q({name:`delay`,description:`Delay before animation starts (seconds)`,type:`Number`,defaultValue:`0`}),q({name:`content`,description:`Content to animate`,type:`Html`,defaultValue:`Html.empty()`}),q({name:`key`,description:`Unique key to trigger re-animation. Change this value to replay the animation`,type:`String`,defaultValue:`""`})]},ack=()=>{return F(`div`,{},[F(`div`,{className:`kl`},[F(`h3`,{className:`km`},[`Available Animations`]),F(`table`,{className:`ko`},[F(`thead`,{},[F(`tr`,{},[F(`th`,{className:`kp`},[`Animation`]),F(`th`,{className:`kp`},[`Effect`]),F(`th`,{className:`kp`},[`Transform`])])]),F(`tbody`,{},[(()=>{const _0=[];const _1=abo();let _i=-1;for(let acl of _1){_i++;_0.push(F(`tr`,{},[F(`td`,{className:`kq`},[F(`code`,{className:`kr`},[acl.id])]),F(`td`,{className:`kq`},[acl.label]),F(`td`,{className:`kq`},[acl.code])]))};return _0})()])])]),F(`div`,{className:`kl`},[F(`h3`,{className:`km`},[`Easing Functions`]),F(`table`,{className:`ko`},[F(`thead`,{},[F(`tr`,{},[F(`th`,{className:`kp`},[`Easing`]),F(`th`,{className:`kp`},[`Description`]),F(`th`,{className:`kp`},[`Best For`])])]),F(`tbody`,{},[F(`tr`,{},[F(`td`,{className:`kq`},[F(`code`,{className:`kr`},[`ease-out`])]),F(`td`,{className:`kq`},[`Starts fast, ends slow`]),F(`td`,{className:`kq`},[`Entering elements ⭐ recommended`])]),F(`tr`,{},[F(`td`,{className:`kq`},[F(`code`,{className:`kr`},[`ease-in`])]),F(`td`,{className:`kq`},[`Starts slow, ends fast`]),F(`td`,{className:`kq`},[`Exiting elements`])]),F(`tr`,{},[F(`td`,{className:`kq`},[F(`code`,{className:`kr`},[`ease-in-out`])]),F(`td`,{className:`kq`},[`Slow start and end`]),F(`td`,{className:`kq`},[`Looping animations`])]),F(`tr`,{},[F(`td`,{className:`kq`},[F(`code`,{className:`kr`},[`linear`])]),F(`td`,{className:`kq`},[`Constant speed`]),F(`td`,{className:`kq`},[`Loading indicators`])])])])]),F(`div`,{className:`kl`},[F(`h3`,{className:`km`},[`Custom Cubic-Bezier Functions`]),F(`p`,{className:`kn`},[`Try these pre-made cubic-bezier curves in the preview above:`]),F(`table`,{className:`ko`},[F(`thead`,{},[F(`tr`,{},[F(`th`,{className:`kp`},[`Name`]),F(`th`,{className:`kp`},[`Cubic-Bezier`]),F(`th`,{className:`kp`},[`Effect`])])]),F(`tbody`,{},[F(`tr`,{},[F(`td`,{className:`kq`},[`Smooth`]),F(`td`,{className:`kq`},[F(`code`,{className:`kr`},[`cubic-bezier(0.4, 0, 0.2, 1)`])]),F(`td`,{className:`kq`},[`Smooth acceleration`])]),F(`tr`,{},[F(`td`,{className:`kq`},[`Bouncy ⭐`]),F(`td`,{className:`kq`},[F(`code`,{className:`kr`},[`cubic-bezier(0.34, 1.56, 0.64, 1)`])]),F(`td`,{className:`kq`},[`Playful bounce effect`])]),F(`tr`,{},[F(`td`,{className:`kq`},[`Back`]),F(`td`,{className:`kq`},[F(`code`,{className:`kr`},[`cubic-bezier(0.68, -0.55, 0.265, 1.55)`])]),F(`td`,{className:`kq`},[`Goes back before moving forward`])]),F(`tr`,{},[F(`td`,{className:`kq`},[`Anticipate`]),F(`td`,{className:`kq`},[F(`code`,{className:`kr`},[`cubic-bezier(0.175, 0.885, 0.32, 1.275)`])]),F(`td`,{className:`kq`},[`Slight overshoot at the end`])])])]),F(`p`,{className:`kn`},[`💡 Tip: Use `,F(`code`,{className:`kr`},[`cubic-bezier: bouncy`]),` from the easing selector to see the effect in real-time!`])])])},acm=()=>{return F(`div`,{className:`kg`},[F(`h3`,{className:`jy`},[`Choose Animation Type`]),F(`div`,{className:`kh`},[(()=>{const _0=[];const _1=abo();let _i=-1;for(let acn of _1){_i++;_0.push(F(`div`,{"onClick":(aco)=>{return abp(acn.id)},className:(E(abj.value,acn.id)?`animationCardActive`:``) + ` ki`},[F(`div`,{className:`kj`},[acn.label]),F(`div`,{className:`kk`},[acn.code])]))};return _0})()])])};return F(BR,{zw:`EnterExit`,zx:`Create smooth enter and exit animations for your elements. Adjust duration, delay, and easing to see the effects in real-time.`,zy:`Component`,zz:acm(),aaa:aby(),aab:acd(),aad:`Wrap any content with the EnterExit component to apply animations. The component automatically handles animation timing and easing. Use the key prop to trigger replay - changing the key value will restart the animation.`,aaf:aci(),aag:acj(),aah:ack(),aal:[`preview`,`usage`,`api`]})},acp=(acq)=>{return (acq.replace(/\b[a-z]/g, char => char.toUpperCase()))},BU=()=>{const acr=()=>{return M(an.value,[[`introduction`,()=>{return F(BB,{})}],[`home`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`Introduction`]),F(`p`,{className:`hq`},[`Welcome to the Mint UI Component Library. `,`This is a comprehensive collection of reusable components.`]),F(`h2`,{className:`hp`},[`Getting Started`]),F(`p`,{className:`hq`},[`Browse through the sidebar to explore different components.`])])}],[`quickstart`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`Quickstart Guide`]),F(`p`,{className:`hq`},[`Get started quickly with our component library.`]),F(`div`,{className:`hr`},[`mint install my-component`])])}],[`advanced-usage`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`Advanced Usage`]),F(`p`,{className:`hq`},[`Learn advanced techniques and patterns.`]),F(`h2`,{className:`hp`},[`Custom Styling`]),F(`p`,{className:`hq`},[`You can customize components using CSS variables.`])])}],[`button`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`Button Component`]),F(`p`,{className:`hq`},[`Buttons allow users to take actions with a single tap.`]),F(`h2`,{className:`hp`},[`Basic Usage`]),F(`div`,{className:`hr`},[`<button>Click me</button>`])])}],[`calendar`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`Calendar Component`]),F(`p`,{className:`hq`},[`Calendar component for date selection.`])])}],[`badge`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`Badge Component`]),F(`p`,{className:`hq`},[`Badge is used to display notification counts or status.`])])}],[`codes`,()=>{return F(BE,{})}],[`themes`,()=>{return F(BG,{})}],[`video-player`,()=>{return F(BJ,{})}],[`matrix`,()=>{return F(BL,{})}],[`tabs`,()=>{return F(BN,{})}],[`address-edit`,()=>{return F(BP,{})}],[`enter-exit`,()=>{return F(BT,{})}],[`gestures`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`Gestures Animations`]),F(`p`,{className:`hq`},[`Interactive gesture-based animations. Content coming soon...`])])}],[`scroll`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`Scroll Animations`]),F(`p`,{className:`hq`},[`Scroll-triggered reveal animations. Content coming soon...`])])}],[`keyframes`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`Keyframes`]),F(`p`,{className:`hq`},[`Complex animation sequences. Content coming soon...`])])}],[`transforms`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`Transforms`]),F(`p`,{className:`hq`},[`Rotation, scale, and transform animations. Content coming soon...`])])}],[`spring`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`Spring Physics`]),F(`p`,{className:`hq`},[`Physics-based spring animations. Content coming soon...`])])}],[`orchestration`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`Orchestration`]),F(`p`,{className:`hq`},[`Stagger and sequence animations. Content coming soon...`])])}],[`not-found`,()=>{return F(J,{},[F(`h1`,{className:`ho`},[`404 - Page Not Found`]),F(`p`,{className:`hq`},[`The page you are looking for does not exist.`])])}],[null,()=>{return F(J,{},[F(`h1`,{className:`ho`},[acp(an.value)]),F(`p`,{className:`hq`},[`This is the `,an.value,` page. Content coming soon...`]),F(`p`,{className:`hq`},[`Section: `,aq.value])])}]])};return F(`div`,{className:`hn`},[acr()])},acs=F(`svg`,{dangerouslySetInnerHTML:{__html:`<path d="M35 0v.351h.185c.17 0 .329.071.475.212.147.118.271.27.37.457.098.19.172.391.22.599.049.21.073.398.073.562v19.53c0 .186-.024.399-.074.633a2.52 2.52 0 0 1-.22.598c-.094.183-.22.35-.369.494a.675.675 0 0 1-.475.21H35v.353h4.005v-.354h-.184a.717.717 0 0 1-.514-.209 2.799 2.799 0 0 1-.405-.494 2.51 2.51 0 0 1-.22-.598 3.136 3.136 0 0 1-.074-.634V3.518l9.002 20.48L56.09 2.43V21.71c0 .187-.024.4-.074.634a1.85 1.85 0 0 1-.256.598c-.097.187-.219.353-.365.494a.68.68 0 0 1-.48.21h-.183v.353h5.216v-.354h-.183a.723.723 0 0 1-.515-.209 2.79 2.79 0 0 1-.403-.494 2.51 2.51 0 0 1-.22-.598 3.135 3.135 0 0 1-.074-.634V2.181c0-.164.025-.352.074-.563a2.52 2.52 0 0 1 .22-.598c.123-.187.256-.34.403-.457a.723.723 0 0 1 .516-.212h.183V0h-4.152l-8.524 19.25L38.747 0zm60.884 2.181L92.21 3.306v.354c.613.024.967.21 1.066.563.121.329.185.69.185 1.09v3.132h-2.058v1.197h2.057v8.76c0 .68.01 1.348.036 2.007a5.88 5.88 0 0 0 .404 1.794c.22.54.576.972 1.066 1.301.49.329 1.177.494 2.058.494.711 0 1.236-.094 1.58-.282.367-.187.65-.364.844-.529a.767.767 0 0 1 .552-.211v-2.568h-.331a3.168 3.168 0 0 1-.88 1.689c-.442.47-.92.704-1.435.704-.343 0-.611-.082-.807-.246-.196-.187-.343-.446-.44-.775a5.305 5.305 0 0 1-.186-1.232 33.518 33.518 0 0 1-.037-1.654V9.642H100V8.446h-4.116zm-29.945.775c-.49 0-.907.165-1.25.494a1.651 1.651 0 0 0-.478 1.195c0 .47.16.857.478 1.162.343.305.76.458 1.249.458.49 0 .908-.153 1.25-.458.343-.305.514-.693.514-1.162 0-.47-.17-.867-.514-1.195a1.741 1.741 0 0 0-1.249-.494zm1.69 5.067L63.952 9.15v.316c.59.024.946.225 1.069.6.122.352.183.728.183 1.126v10.518c0 .187-.026.4-.074.634a2.48 2.48 0 0 1-.22.598c-.098.187-.22.354-.367.494a.717.717 0 0 1-.514.21V24h4.776v-.354a.722.722 0 0 1-.516-.209 1.887 1.887 0 0 1-.366-.494 2.51 2.51 0 0 1-.22-.598 3.136 3.136 0 0 1-.074-.634zm8.745.036-3.675 1.127v.317c.588.023.943.222 1.065.598.122.351.185.727.185 1.126V21.71c0 .187-.024.4-.074.634-.05.212-.137.415-.258.598-.097.187-.22.353-.365.494a.68.68 0 0 1-.48.21v.353h4.778v-.354a.717.717 0 0 1-.514-.209 4.506 4.506 0 0 1-.368-.494c-.099-.19-.173-.39-.221-.598a3.135 3.135 0 0 1-.074-.634v-8.583c0-.492.123-.963.37-1.409.268-.469.598-.865.99-1.195a5.285 5.285 0 0 1 1.397-.846 4.404 4.404 0 0 1 1.617-.316c.538 0 1.064.105 1.58.317a3.694 3.694 0 0 1 1.433.915c.417.422.747.95.992 1.583s.367 1.372.367 2.218v7.316c0 .187-.024.4-.074.634-.05.212-.137.414-.258.598-.097.187-.22.353-.366.494a.68.68 0 0 1-.48.21v.353h4.742v-.354a.722.722 0 0 1-.515-.21 4.506 4.506 0 0 1-.368-.493 2.51 2.51 0 0 1-.22-.598 3.135 3.135 0 0 1-.073-.634v-7.562c0-.681-.122-1.374-.367-2.077a5.284 5.284 0 0 0-1.103-1.97c-.515-.61-1.175-1.102-1.983-1.478-.809-.376-1.789-.564-2.94-.564-.686 0-1.287.071-1.801.212-.49.118-.932.281-1.324.492a4.7 4.7 0 0 0-.954.634 5.485 5.485 0 0 0-.662.598z"/>
    <path d="M25.17.004a4.599 4.599 0 0 0-1.394.597.48.48 0 0 0-.596-.435 6.74 6.74 0 0 0-1.905.823.48.48 0 0 0-.624-.34 7.053 7.053 0 0 0-2.401 1.489.515.515 0 0 0-.244-.323.478.478 0 0 0-.431-.015c-.46.209-1.574.826-2.709 2.29l.021.01c-1.285 1.314-2.407 2.785-3.159 4.85a.543.543 0 0 1-.436.365.47.47 0 0 1-.457-.21 3.648 3.648 0 0 0-.283-.376c-1.325 2.659-1.163 8.536.036 11.255 1.146 2.69 1.418 3.715 1.462 3.931.222-.722.604-1.954.683-2.216a52.335 52.334 0 0 1 1.28-3.709c-.999-1.844-1.144-4.452-.53-6.855.186-.729 1.086-.566.903.142-.474 1.84-.456 3.86.142 5.432a52.362 52.36 0 0 1 2.72-5.563 10.452 10.452 0 0 1 .138-3.5 3.682 3.682 0 0 1 .453-1.198c.416-.613 1.142-.08.736.518-.012.02-.015.02-.014.016l-.036.085a4.231 4.231 0 0 0-.214.658 7.92 7.92 0 0 0-.195 1.94 51.87 51.87 0 0 1 4.547-6.344c.462-.545 1.13.06.68.59a50.105 50.104 0 0 0-4.473 6.245 10.607 10.606 0 0 0 1.631-.94 4.526 4.526 0 0 0 .497-.415c.036-.035.056-.052.066-.06-.005.002-.005.001.008-.018.316-.603 1.176-.001.736.514a3.527 3.527 0 0 1-.86.793 15.98 15.98 0 0 1-2.934 1.58 51.404 51.402 0 0 0-2.664 5.456c1.52-.627 2.966-1.772 4.122-2.998.427-.49 1.121.224.635.654-1.46 1.55-3.307 2.968-5.264 3.608-.49 1.266-1.397 4.487-1.727 5.67.547-.61 1.898-1.779 5.155-3.097 4.125-1.57 5.65-4.046 6.119-5.046a.518.518 0 0 0-.208-.658A2.135 2.135 0 0 0 23.68 15a15.548 15.548 0 0 0 1.847-3.279.529.529 0 0 0-.004-.399.481.481 0 0 0-.273-.261 2.5 2.5 0 0 0-.478-.125 7.102 7.102 0 0 0 .914-2.782.502.502 0 0 0-.127-.377.488.488 0 0 0-.351-.164h-.021a7.68 7.68 0 0 0 .721-2.388.496.496 0 0 0-.436-.556 8.274 8.274 0 0 0 .502-1.878.509.509 0 0 0-.127-.407.478.478 0 0 0-.353-.162A5.486 5.486 0 0 0 25.99.815a.92.92 0 0 0-.087-.55c-.142-.316-.63-.262-.732-.26zM2.686.288c-.012 0-.02.003-.032.004a.587.587 0 0 0-.045.004c-.021.004-.044.006-.065.013a.313.313 0 0 0-.026.01c-.003 0-.003.002-.006.003a.49.49 0 0 0-.065.033c-.01.005-.021.009-.03.015a.488.488 0 0 0-.214.436A4.52 4.52 0 0 0 .745.412a1.02 1.02 0 0 1-.062.006l-.095.01L.526.44l-.04.009a1.13 1.13 0 0 0-.108.03C.357.485.338.495.317.504.303.51.287.514.273.522.252.532.235.545.215.559L.18.585C.16.602.14.617.124.637.116.645.111.658.104.667L.098.675a.375.375 0 0 0-.05.098.92.92 0 0 0-.011.556A5.518 5.518 0 0 0 .719 2.65a.484.484 0 0 0-.326.21.521.521 0 0 0-.07.422 8.376 8.376 0 0 0 .748 1.793.46.46 0 0 0-.27.18.494.494 0 0 0-.086.433 7.61 7.61 0 0 0 1.039 2.264h-.023a.496.496 0 0 0-.326.209.52.52 0 0 0-.076.394 7.06 7.06 0 0 0 1.28 2.628 2.454 2.454 0 0 0-.457.19.482.482 0 0 0-.235.294.534.534 0 0 0 .05.397 15.486 15.486 0 0 0 2.271 2.992 2.264 2.264 0 0 0-.476.27.513.513 0 0 0-.116.675c.03.047.064.099.101.153.04.057.084.115.131.178l.008.01a8.185 8.184 0 0 0 1.317 1.375l.02.017a9.299 9.298 0 0 0 .324.26c.051.038.103.073.155.11.07.052.142.102.216.153l.203.135c.064.042.124.085.19.126.076.048.155.094.233.14l.188.111c.086.048.175.095.263.142l.188.098c.096.048.196.095.294.141.063.03.12.06.184.09.112.05.227.098.341.146.043.018.083.038.127.056l.004.002.036.013c.093.037.879.262 1.542.41-.49-1.136-.8-2.63-.924-4.212a18.741 18.741 0 0 1-1.543-1.192c-.568-.406.105-1.247.616-.77.278.24.576.471.876.698a18.048 18.048 0 0 1 .284-3.547 17.257 17.257 0 0 1-3.166-1.317 3.753 3.753 0 0 1-1.007-.751c-.528-.505.335-1.248.738-.637.017.02.014.023.009.02.011.008.035.025.078.059a4.876 4.876 0 0 0 .58.39 11.42 11.42 0 0 0 1.855.828A53.467 53.466 0 0 0 4.855 5.52a54.048 54.047 0 0 0-2.213-2.285c-.54-.52.117-1.242.67-.709A55.397 55.396 0 0 1 8.87 8.824a8.46 8.46 0 0 0-.41-2.057 4.48 4.48 0 0 0-.297-.68l-.048-.09c0 .005-.001.007-.017-.013-.499-.596.227-1.247.738-.636a3.935 3.935 0 0 1 .614 1.236c.17.538.29 1.09.376 1.647.063-.13.125-.262.193-.381a.537.537 0 0 1 .303-.236.461.461 0 0 1 .361.042 1.9 1.9 0 0 1 .438.36c.651-1.54 1.555-3.081 2.664-4.326-.424-.511-1.31-1.196-1.343-1.223-.01-.008-.022-.01-.032-.017a.51.51 0 0 0-.385-.09.484.484 0 0 0-.326.236 2.509 2.509 0 0 0-.184.431l-.049-.043a9.845 9.845 0 0 0-.355-.325l-.053-.05a8.856 8.856 0 0 0-.396-.32L10.6 2.24a8.464 8.464 0 0 0-.406-.292l-.05-.03a7.403 7.403 0 0 0-.585-.347c-.018-.01-.034-.022-.051-.03l-.074-.038c-.037-.019-.072-.035-.108-.052l-.047-.022c-.042-.02-.084-.043-.124-.06l-.036-.016c-.041-.018-.08-.037-.119-.052l-.036-.013c-.036-.015-.074-.028-.11-.042l-.042-.015c-.029-.01-.062-.025-.09-.035l-.071-.026-.04-.011-.102-.033a.537.537 0 0 0-.127-.02h-.01c-.01.001-.02.005-.03.005-.027 0-.056 0-.082.006a.461.461 0 0 0-.178.083.516.516 0 0 0-.199.35A6.995 6.994 0 0 0 5.308.416H5.3A.477.477 0 0 0 5.192.41c-.016 0-.033.004-.049.006a.473.473 0 0 0-.408.427A6.735 6.735 0 0 0 2.739.29L2.735.286c-.017-.002-.034 0-.05 0z"/>`},viewBox:`0 0 100 24`,height:`24`,width:`100`}),act=(acu)=>{return (acu.getUTCFullYear())},acv=()=>{return (new Date())},BV=()=>{H(()=>{(()=>{return af()})()},[]);return F(`div`,{className:`ks`},[F(AZ,{}),F(`div`,{className:`kt`},[F(BA,{br:true}),F(`div`,{className:`ku`},[F(`div`,{className:`kv`},[F(BU,{}),F(`div`,{className:`kw`},[acs,F(`small`,{},[`2018 - ${act(acv())}`])])])])])])};export default ()=>{R(BV,{},V,[{await:false,path:`/`,decoders:[],mapping:[],handler:()=>{return at(`introduction`,`Essentials`)}},{await:false,path:`/introduction`,decoders:[],mapping:[],handler:()=>{return at(`introduction`,`Essentials`)}},{await:false,path:`/home`,decoders:[],mapping:[],handler:()=>{return at(`home`,`Essentials`)}},{await:false,path:`/quickstart`,decoders:[],mapping:[],handler:()=>{return at(`quickstart`,`Essentials`)}},{await:false,path:`/themes`,decoders:[],mapping:[],handler:()=>{return at(`themes`,`Essentials`)}},{await:false,path:`/advanced-usage`,decoders:[],mapping:[],handler:()=>{return at(`advanced-usage`,`Essentials`)}},{await:false,path:`/faq`,decoders:[],mapping:[],handler:()=>{return at(`faq`,`Essentials`)}},{await:false,path:`/changelog`,decoders:[],mapping:[],handler:()=>{return at(`changelog`,`Essentials`)}},{await:false,path:`/button`,decoders:[],mapping:[],handler:()=>{return at(`button`,`Basic Components`)}},{await:false,path:`/cell`,decoders:[],mapping:[],handler:()=>{return at(`cell`,`Basic Components`)}},{await:false,path:`/icon`,decoders:[],mapping:[],handler:()=>{return at(`icon`,`Basic Components`)}},{await:false,path:`/image`,decoders:[],mapping:[],handler:()=>{return at(`image`,`Basic Components`)}},{await:false,path:`/layout`,decoders:[],mapping:[],handler:()=>{return at(`layout`,`Basic Components`)}},{await:false,path:`/calendar`,decoders:[],mapping:[],handler:()=>{return at(`calendar`,`Form Components`)}},{await:false,path:`/checkbox`,decoders:[],mapping:[],handler:()=>{return at(`checkbox`,`Form Components`)}},{await:false,path:`/date-picker`,decoders:[],mapping:[],handler:()=>{return at(`date-picker`,`Form Components`)}},{await:false,path:`/field`,decoders:[],mapping:[],handler:()=>{return at(`field`,`Form Components`)}},{await:false,path:`/form`,decoders:[],mapping:[],handler:()=>{return at(`form`,`Form Components`)}},{await:false,path:`/badge`,decoders:[],mapping:[],handler:()=>{return at(`badge`,`Display Components`)}},{await:false,path:`/circle`,decoders:[],mapping:[],handler:()=>{return at(`circle`,`Display Components`)}},{await:false,path:`/collapse`,decoders:[],mapping:[],handler:()=>{return at(`collapse`,`Display Components`)}},{await:false,path:`/countdown`,decoders:[],mapping:[],handler:()=>{return at(`countdown`,`Display Components`)}},{await:false,path:`/video-player`,decoders:[],mapping:[],handler:()=>{return at(`video-player`,`Display Components`)}},{await:false,path:`/matrix`,decoders:[],mapping:[],handler:()=>{return at(`matrix`,`Display Components`)}},{await:false,path:`/tabs`,decoders:[],mapping:[],handler:()=>{return at(`tabs`,`Navigation Components`)}},{await:false,path:`/address-edit`,decoders:[],mapping:[],handler:()=>{return at(`address-edit`,`Business Components`)}},{await:false,path:`/codes`,decoders:[],mapping:[],handler:()=>{return at(`codes`,`Tools`)}},{await:false,path:`/qr-code`,decoders:[],mapping:[],handler:()=>{return at(`codes`,`Tools`)}},{await:false,path:`/barcode`,decoders:[],mapping:[],handler:()=>{return at(`codes`,`Tools`)}},{await:false,path:`/animations/enter-exit`,decoders:[],mapping:[],handler:()=>{return at(`enter-exit`,`Wū Animations`)}},{await:false,path:`/animations/gestures`,decoders:[],mapping:[],handler:()=>{return at(`gestures`,`Wū Animations`)}},{await:false,path:`/animations/scroll`,decoders:[],mapping:[],handler:()=>{return at(`scroll`,`Wū Animations`)}},{await:false,path:`/animations/keyframes`,decoders:[],mapping:[],handler:()=>{return at(`keyframes`,`Wū Animations`)}},{await:false,path:`/animations/transforms`,decoders:[],mapping:[],handler:()=>{return at(`transforms`,`Wū Animations`)}},{await:false,path:`/animations/spring`,decoders:[],mapping:[],handler:()=>{return at(`spring`,`Wū Animations`)}},{await:false,path:`/animations/orchestration`,decoders:[],mapping:[],handler:()=>{return at(`orchestration`,`Wū Animations`)}},{await:false,path:`*`,decoders:[],mapping:[],handler:()=>{return at(`not-found`,``)}}],false)};