{ fetchurl }: let

  fetchNuGet = { name, version, sha256 }: fetchurl {
    inherit sha256;
    url = "https://www.nuget.org/api/v2/package/${name}/${version}";
  };

in [

  (fetchNuGet {
    name = "FParsec";
    version = "1.0.3";
    sha256 = "124p2sqvnwnq752hhvf6rl2k14w05xbsxszb6yf1623ggnc16xp0";
  })

  (fetchNuGet {
    name = "FSharp.CommandLine";
    version = "3.3.3805.29705";
    sha256 = "11hm2jsgf0697z3la17qmcidpr46lw6h2y9ymgb04gf0p5hdzmvh";
  })

  (fetchNuGet {
    name = "FSharp.Core";
    version = "4.7.0";
    sha256 = "0j11325gmaaa97jvx6xfl7a5ya86zixjjydjmgj64pdx0rpbi9pd";
  })

  (fetchNuGet {
    name = "FSharp.Data";
    version = "3.3.3";
    sha256 = "1wykawndcyb51110m8ijf4x4adspqyq5w4gl38hhbgkr335z6cxl";
  })

  (fetchNuGet {
    name = "FSharp.Scanf";
    version = "3.3.3805.29705";
    sha256 = "1wyy5mns51qj635frsmq057pqrgacm51fl9sqs7hmr39q5zd36p1";
  })

  (fetchNuGet {
    name = "Microsoft.NETCore.Platforms";
    version = "1.1.0";
    sha256 = "08vh1r12g6ykjygq5d3vq09zylgb84l63k49jc4v8faw9g93iqqm";
  })

  (fetchNuGet {
    name = "Microsoft.NETCore.Targets";
    version = "1.1.0";
    sha256 = "193xwf33fbm0ni3idxzbr5fdq3i2dlfgihsac9jj7whj0gd902nh";
  })

  (fetchNuGet {
    name = "Microsoft.Win32.Primitives";
    version = "4.3.0";
    sha256 = "0j0c1wj4ndj21zsgivsc24whiya605603kxrbiw6wkfdync464wq";
  })

  (fetchNuGet {
    name = "NETStandard.Library";
    version = "1.6.1";
    sha256 = "1z70wvsx2d847a2cjfii7b83pjfs34q05gb037fdjikv5kbagml8";
  })

  (fetchNuGet {
    name = "NETStandard.Library";
    version = "2.0.3";
    sha256 = "1fn9fxppfcg4jgypp2pmrpr6awl3qz1xmnri0cygpkwvyx27df1y";
  })

  (fetchNuGet {
    name = "runtime.debian.8-x64.runtime.native.System.Security.Cryptography.OpenSsl";
    version = "4.3.0";
    sha256 = "16rnxzpk5dpbbl1x354yrlsbvwylrq456xzpsha1n9y3glnhyx9d";
  })

  (fetchNuGet {
    name = "runtime.fedora.23-x64.runtime.native.System.Security.Cryptography.OpenSsl";
    version = "4.3.0";
    sha256 = "0hkg03sgm2wyq8nqk6dbm9jh5vcq57ry42lkqdmfklrw89lsmr59";
  })

  (fetchNuGet {
    name = "runtime.fedora.24-x64.runtime.native.System.Security.Cryptography.OpenSsl";
    version = "4.3.0";
    sha256 = "0c2p354hjx58xhhz7wv6div8xpi90sc6ibdm40qin21bvi7ymcaa";
  })

  (fetchNuGet {
    name = "runtime.native.System";
    version = "4.3.0";
    sha256 = "15hgf6zaq9b8br2wi1i3x0zvmk410nlmsmva9p0bbg73v6hml5k4";
  })

  (fetchNuGet {
    name = "runtime.native.System.IO.Compression";
    version = "4.3.0";
    sha256 = "1vvivbqsk6y4hzcid27pqpm5bsi6sc50hvqwbcx8aap5ifrxfs8d";
  })

  (fetchNuGet {
    name = "runtime.native.System.Net.Http";
    version = "4.3.0";
    sha256 = "1n6rgz5132lcibbch1qlf0g9jk60r0kqv087hxc0lisy50zpm7kk";
  })

  (fetchNuGet {
    name = "runtime.native.System.Security.Cryptography.Apple";
    version = "4.3.0";
    sha256 = "1b61p6gw1m02cc1ry996fl49liiwky6181dzr873g9ds92zl326q";
  })

  (fetchNuGet {
    name = "runtime.native.System.Security.Cryptography.OpenSsl";
    version = "4.3.0";
    sha256 = "18pzfdlwsg2nb1jjjjzyb5qlgy6xjxzmhnfaijq5s2jw3cm3ab97";
  })

  (fetchNuGet {
    name = "runtime.opensuse.13.2-x64.runtime.native.System.Security.Cryptography.OpenSsl";
    version = "4.3.0";
    sha256 = "0qyynf9nz5i7pc26cwhgi8j62ps27sqmf78ijcfgzab50z9g8ay3";
  })

  (fetchNuGet {
    name = "runtime.opensuse.42.1-x64.runtime.native.System.Security.Cryptography.OpenSsl";
    version = "4.3.0";
    sha256 = "1klrs545awhayryma6l7g2pvnp9xy4z0r1i40r80zb45q3i9nbyf";
  })

  (fetchNuGet {
    name = "runtime.osx.10.10-x64.runtime.native.System.Security.Cryptography.Apple";
    version = "4.3.0";
    sha256 = "10yc8jdrwgcl44b4g93f1ds76b176bajd3zqi2faf5rvh1vy9smi";
  })

  (fetchNuGet {
    name = "runtime.osx.10.10-x64.runtime.native.System.Security.Cryptography.OpenSsl";
    version = "4.3.0";
    sha256 = "0zcxjv5pckplvkg0r6mw3asggm7aqzbdjimhvsasb0cgm59x09l3";
  })

  (fetchNuGet {
    name = "runtime.rhel.7-x64.runtime.native.System.Security.Cryptography.OpenSsl";
    version = "4.3.0";
    sha256 = "0vhynn79ih7hw7cwjazn87rm9z9fj0rvxgzlab36jybgcpcgphsn";
  })

  (fetchNuGet {
    name = "runtime.ubuntu.14.04-x64.runtime.native.System.Security.Cryptography.OpenSsl";
    version = "4.3.0";
    sha256 = "160p68l2c7cqmyqjwxydcvgw7lvl1cr0znkw8fp24d1by9mqc8p3";
  })

  (fetchNuGet {
    name = "runtime.ubuntu.16.04-x64.runtime.native.System.Security.Cryptography.OpenSsl";
    version = "4.3.0";
    sha256 = "15zrc8fgd8zx28hdghcj5f5i34wf3l6bq5177075m2bc2j34jrqy";
  })

  (fetchNuGet {
    name = "runtime.ubuntu.16.10-x64.runtime.native.System.Security.Cryptography.OpenSsl";
    version = "4.3.0";
    sha256 = "1p4dgxax6p7rlgj4q73k73rslcnz4wdcv8q2flg1s8ygwcm58ld5";
  })

  (fetchNuGet {
    name = "System.AppContext";
    version = "4.3.0";
    sha256 = "1649qvy3dar900z3g817h17nl8jp4ka5vcfmsr05kh0fshn7j3ya";
  })

  (fetchNuGet {
    name = "System.Buffers";
    version = "4.3.0";
    sha256 = "0fgns20ispwrfqll4q1zc1waqcmylb3zc50ys9x8zlwxh9pmd9jy";
  })

  (fetchNuGet {
    name = "System.Collections";
    version = "4.3.0";
    sha256 = "19r4y64dqyrq6k4706dnyhhw7fs24kpp3awak7whzss39dakpxk9";
  })

  (fetchNuGet {
    name = "System.Collections.Concurrent";
    version = "4.3.0";
    sha256 = "0wi10md9aq33jrkh2c24wr2n9hrpyamsdhsxdcnf43b7y86kkii8";
  })

  (fetchNuGet {
    name = "System.Console";
    version = "4.3.0";
    sha256 = "1flr7a9x920mr5cjsqmsy9wgnv3lvd0h1g521pdr1lkb2qycy7ay";
  })

  (fetchNuGet {
    name = "System.Diagnostics.Debug";
    version = "4.3.0";
    sha256 = "00yjlf19wjydyr6cfviaph3vsjzg3d5nvnya26i2fvfg53sknh3y";
  })

  (fetchNuGet {
    name = "System.Diagnostics.DiagnosticSource";
    version = "4.3.0";
    sha256 = "0z6m3pbiy0qw6rn3n209rrzf9x1k4002zh90vwcrsym09ipm2liq";
  })

  (fetchNuGet {
    name = "System.Diagnostics.Tools";
    version = "4.3.0";
    sha256 = "0in3pic3s2ddyibi8cvgl102zmvp9r9mchh82ns9f0ms4basylw1";
  })

  (fetchNuGet {
    name = "System.Diagnostics.Tracing";
    version = "4.3.0";
    sha256 = "1m3bx6c2s958qligl67q7grkwfz3w53hpy7nc97mh6f7j5k168c4";
  })

  (fetchNuGet {
    name = "System.Globalization";
    version = "4.3.0";
    sha256 = "1cp68vv683n6ic2zqh2s1fn4c2sd87g5hpp6l4d4nj4536jz98ki";
  })

  (fetchNuGet {
    name = "System.Globalization.Calendars";
    version = "4.3.0";
    sha256 = "1xwl230bkakzzkrggy1l1lxmm3xlhk4bq2pkv790j5lm8g887lxq";
  })

  (fetchNuGet {
    name = "System.Globalization.Extensions";
    version = "4.3.0";
    sha256 = "02a5zfxavhv3jd437bsncbhd2fp1zv4gxzakp1an9l6kdq1mcqls";
  })

  (fetchNuGet {
    name = "System.IO";
    version = "4.3.0";
    sha256 = "05l9qdrzhm4s5dixmx68kxwif4l99ll5gqmh7rqgw554fx0agv5f";
  })

  (fetchNuGet {
    name = "System.IO.Compression";
    version = "4.3.0";
    sha256 = "084zc82yi6yllgda0zkgl2ys48sypiswbiwrv7irb3r0ai1fp4vz";
  })

  (fetchNuGet {
    name = "System.IO.Compression.ZipFile";
    version = "4.3.0";
    sha256 = "1yxy5pq4dnsm9hlkg9ysh5f6bf3fahqqb6p8668ndy5c0lk7w2ar";
  })

  (fetchNuGet {
    name = "System.IO.FileSystem";
    version = "4.3.0";
    sha256 = "0z2dfrbra9i6y16mm9v1v6k47f0fm617vlb7s5iybjjsz6g1ilmw";
  })

  (fetchNuGet {
    name = "System.IO.FileSystem.Primitives";
    version = "4.3.0";
    sha256 = "0j6ndgglcf4brg2lz4wzsh1av1gh8xrzdsn9f0yznskhqn1xzj9c";
  })

  (fetchNuGet {
    name = "System.Linq";
    version = "4.3.0";
    sha256 = "1w0gmba695rbr80l1k2h4mrwzbzsyfl2z4klmpbsvsg5pm4a56s7";
  })

  (fetchNuGet {
    name = "System.Linq.Expressions";
    version = "4.3.0";
    sha256 = "0ky2nrcvh70rqq88m9a5yqabsl4fyd17bpr63iy2mbivjs2nyypv";
  })

  (fetchNuGet {
    name = "System.Net.Http";
    version = "4.3.0";
    sha256 = "1i4gc757xqrzflbk7kc5ksn20kwwfjhw9w7pgdkn19y3cgnl302j";
  })

  (fetchNuGet {
    name = "System.Net.Primitives";
    version = "4.3.0";
    sha256 = "0c87k50rmdgmxx7df2khd9qj7q35j9rzdmm2572cc55dygmdk3ii";
  })

  (fetchNuGet {
    name = "System.Net.Sockets";
    version = "4.3.0";
    sha256 = "1ssa65k6chcgi6mfmzrznvqaxk8jp0gvl77xhf1hbzakjnpxspla";
  })

  (fetchNuGet {
    name = "System.ObjectModel";
    version = "4.3.0";
    sha256 = "191p63zy5rpqx7dnrb3h7prvgixmk168fhvvkkvhlazncf8r3nc2";
  })

  (fetchNuGet {
    name = "System.Reflection";
    version = "4.3.0";
    sha256 = "0xl55k0mw8cd8ra6dxzh974nxif58s3k1rjv1vbd7gjbjr39j11m";
  })

  (fetchNuGet {
    name = "System.Reflection.Emit";
    version = "4.3.0";
    sha256 = "11f8y3qfysfcrscjpjym9msk7lsfxkk4fmz9qq95kn3jd0769f74";
  })

  (fetchNuGet {
    name = "System.Reflection.Emit.ILGeneration";
    version = "4.3.0";
    sha256 = "0w1n67glpv8241vnpz1kl14sy7zlnw414aqwj4hcx5nd86f6994q";
  })

  (fetchNuGet {
    name = "System.Reflection.Emit.Lightweight";
    version = "4.3.0";
    sha256 = "0ql7lcakycrvzgi9kxz1b3lljd990az1x6c4jsiwcacrvimpib5c";
  })

  (fetchNuGet {
    name = "System.Reflection.Extensions";
    version = "4.3.0";
    sha256 = "02bly8bdc98gs22lqsfx9xicblszr2yan7v2mmw3g7hy6miq5hwq";
  })

  (fetchNuGet {
    name = "System.Reflection.Primitives";
    version = "4.3.0";
    sha256 = "04xqa33bld78yv5r93a8n76shvc8wwcdgr1qvvjh959g3rc31276";
  })

  (fetchNuGet {
    name = "System.Reflection.TypeExtensions";
    version = "4.3.0";
    sha256 = "0y2ssg08d817p0vdag98vn238gyrrynjdj4181hdg780sif3ykp1";
  })

  (fetchNuGet {
    name = "System.Resources.ResourceManager";
    version = "4.3.0";
    sha256 = "0sjqlzsryb0mg4y4xzf35xi523s4is4hz9q4qgdvlvgivl7qxn49";
  })

  (fetchNuGet {
    name = "System.Runtime";
    version = "4.3.0";
    sha256 = "066ixvgbf2c929kgknshcxqj6539ax7b9m570cp8n179cpfkapz7";
  })

  (fetchNuGet {
    name = "System.Runtime.Extensions";
    version = "4.3.0";
    sha256 = "1ykp3dnhwvm48nap8q23893hagf665k0kn3cbgsqpwzbijdcgc60";
  })

  (fetchNuGet {
    name = "System.Runtime.Handles";
    version = "4.3.0";
    sha256 = "0sw2gfj2xr7sw9qjn0j3l9yw07x73lcs97p8xfc9w1x9h5g5m7i8";
  })

  (fetchNuGet {
    name = "System.Runtime.InteropServices";
    version = "4.3.0";
    sha256 = "00hywrn4g7hva1b2qri2s6rabzwgxnbpw9zfxmz28z09cpwwgh7j";
  })

  (fetchNuGet {
    name = "System.Runtime.InteropServices.RuntimeInformation";
    version = "4.3.0";
    sha256 = "0q18r1sh4vn7bvqgd6dmqlw5v28flbpj349mkdish2vjyvmnb2ii";
  })

  (fetchNuGet {
    name = "System.Runtime.Numerics";
    version = "4.3.0";
    sha256 = "19rav39sr5dky7afygh309qamqqmi9kcwvz3i0c5700v0c5cg61z";
  })

  (fetchNuGet {
    name = "System.Security.Cryptography.Algorithms";
    version = "4.3.0";
    sha256 = "03sq183pfl5kp7gkvq77myv7kbpdnq3y0xj7vi4q1kaw54sny0ml";
  })

  (fetchNuGet {
    name = "System.Security.Cryptography.Cng";
    version = "4.3.0";
    sha256 = "1k468aswafdgf56ab6yrn7649kfqx2wm9aslywjam1hdmk5yypmv";
  })

  (fetchNuGet {
    name = "System.Security.Cryptography.Csp";
    version = "4.3.0";
    sha256 = "1x5wcrddf2s3hb8j78cry7yalca4lb5vfnkrysagbn6r9x6xvrx1";
  })

  (fetchNuGet {
    name = "System.Security.Cryptography.Encoding";
    version = "4.3.0";
    sha256 = "1jr6w70igqn07k5zs1ph6xja97hxnb3mqbspdrff6cvssgrixs32";
  })

  (fetchNuGet {
    name = "System.Security.Cryptography.OpenSsl";
    version = "4.3.0";
    sha256 = "0givpvvj8yc7gv4lhb6s1prq6p2c4147204a0wib89inqzd87gqc";
  })

  (fetchNuGet {
    name = "System.Security.Cryptography.Primitives";
    version = "4.3.0";
    sha256 = "0pyzncsv48zwly3lw4f2dayqswcfvdwq2nz0dgwmi7fj3pn64wby";
  })

  (fetchNuGet {
    name = "System.Security.Cryptography.X509Certificates";
    version = "4.3.0";
    sha256 = "0valjcz5wksbvijylxijjxb1mp38mdhv03r533vnx1q3ikzdav9h";
  })

  (fetchNuGet {
    name = "System.Text.Encoding";
    version = "4.3.0";
    sha256 = "1f04lkir4iladpp51sdgmis9dj4y8v08cka0mbmsy0frc9a4gjqr";
  })

  (fetchNuGet {
    name = "System.Text.Encoding.Extensions";
    version = "4.3.0";
    sha256 = "11q1y8hh5hrp5a3kw25cb6l00v5l5dvirkz8jr3sq00h1xgcgrxy";
  })

  (fetchNuGet {
    name = "System.Text.RegularExpressions";
    version = "4.3.0";
    sha256 = "1bgq51k7fwld0njylfn7qc5fmwrk2137gdq7djqdsw347paa9c2l";
  })

  (fetchNuGet {
    name = "System.Threading";
    version = "4.3.0";
    sha256 = "0rw9wfamvhayp5zh3j7p1yfmx9b5khbf4q50d8k5rk993rskfd34";
  })

  (fetchNuGet {
    name = "System.Threading.Tasks";
    version = "4.3.0";
    sha256 = "134z3v9abw3a6jsw17xl3f6hqjpak5l682k2vz39spj4kmydg6k7";
  })

  (fetchNuGet {
    name = "System.Threading.Tasks.Extensions";
    version = "4.3.0";
    sha256 = "1xxcx2xh8jin360yjwm4x4cf5y3a2bwpn2ygkfkwkicz7zk50s2z";
  })

  (fetchNuGet {
    name = "System.Threading.Timer";
    version = "4.3.0";
    sha256 = "1nx773nsx6z5whv8kaa1wjh037id2f1cxhb69pvgv12hd2b6qs56";
  })

  (fetchNuGet {
    name = "System.Xml.ReaderWriter";
    version = "4.3.0";
    sha256 = "0c47yllxifzmh8gq6rq6l36zzvw4kjvlszkqa9wq3fr59n0hl3s1";
  })

  (fetchNuGet {
    name = "System.Xml.XDocument";
    version = "4.3.0";
    sha256 = "08h8fm4l77n0nd4i4fk2386y809bfbwqb7ih9d7564ifcxr5ssxd";
  })

]