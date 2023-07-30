import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'id', 'ms', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? idText = '',
    String? msText = '',
    String? ptText = '',
  }) =>
      [enText, idText, msText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    '3p97u62u': {
      'en': 'Welcome Back!',
      'id': 'Selamat Datang kembali!',
      'ms': 'Selamat kembali!',
      'pt': 'Bem vindo de volta!',
    },
    'xkz4xjo6': {
      'en': 'Use the form below to access your account.',
      'id': 'Gunakan formulir di bawah ini untuk mengakses akun Anda.',
      'ms': 'Gunakan borang di bawah untuk mengakses akaun anda.',
      'pt': 'Use o formulário abaixo para acessar sua conta.',
    },
    'k9u5spqi': {
      'en': 'Email Address',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
      'pt': 'Endereço de email',
    },
    'f4xxyrqv': {
      'en': 'Enter your email here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
      'pt': 'Digite seu email aqui...',
    },
    'lfzvgi5q': {
      'en': 'Password',
      'id': 'Kata sandi',
      'ms': 'Kata laluan',
      'pt': 'Senha',
    },
    'wt8sx5du': {
      'en': 'Enter your password here...',
      'id': 'Masukkan sandi Anda di sini...',
      'ms': 'Masukkan kata laluan anda di sini...',
      'pt': 'Digite sua senha aqui...',
    },
    's8bicxzh': {
      'en': 'Forgot Password?',
      'id': 'Tidak ingat kata sandi?',
      'ms': 'Lupa kata laluan?',
      'pt': 'Esqueceu sua senha?',
    },
    'm9klj9ah': {
      'en': 'Login',
      'id': 'Gabung',
      'ms': 'Log masuk',
      'pt': 'Conecte-se',
    },
    'zy328lg7': {
      'en': 'Use a social platform to continue',
      'id': 'Gunakan platform sosial untuk melanjutkan',
      'ms': 'Gunakan platform sosial untuk meneruskan',
      'pt': 'Use uma plataforma social para continuar',
    },
    'tcu0c8bu': {
      'en': 'Don\'t have an account?',
      'id': 'Belum punya akun?',
      'ms': 'Tiada akaun?',
      'pt': 'Não tem uma conta?',
    },
    'kk2rdqi2': {
      'en': 'Create Account',
      'id': 'Buat Akun',
      'ms': 'Buat akaun',
      'pt': 'Criar uma conta',
    },
    'iha5socs': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
      'pt': 'Lar',
    },
  },
  // createAccount
  {
    'l2xxy1gf': {
      'en': 'Get Started',
      'id': 'Memulai',
      'ms': 'Mulakan',
      'pt': 'Iniciar',
    },
    '59g0bt96': {
      'en': 'Use the form below to get started.',
      'id': 'Gunakan formulir di bawah ini untuk memulai.',
      'ms': 'Gunakan borang di bawah untuk bermula.',
      'pt': 'Use o formulário abaixo para começar.',
    },
    'seheok8a': {
      'en': 'Email Address',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
      'pt': 'Endereço de email',
    },
    '0uknk55c': {
      'en': 'Enter your email here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
      'pt': 'Digite seu email aqui...',
    },
    'pj22exzm': {
      'en': 'Password',
      'id': 'Kata sandi',
      'ms': 'Kata laluan',
      'pt': 'Senha',
    },
    'oxr28tp7': {
      'en': 'Enter your password here...',
      'id': 'Masukkan sandi Anda di sini...',
      'ms': 'Masukkan kata laluan anda di sini...',
      'pt': 'Digite sua senha aqui...',
    },
    'kx2trk1o': {
      'en': 'Confirm Password',
      'id': 'konfirmasi sandi',
      'ms': 'Sahkan Kata Laluan',
      'pt': 'Confirme sua senha',
    },
    'k8c3y3u7': {
      'en': 'Enter your password again here...',
      'id': 'Masukkan kata sandi Anda lagi di sini...',
      'ms': 'Masukkan kata laluan anda sekali lagi di sini...',
      'pt': 'Digite sua senha novamente aqui...',
    },
    '29ut49wi': {
      'en': 'Create Account',
      'id': 'Buat Akun',
      'ms': 'Buat akaun',
      'pt': 'Criar uma conta',
    },
    '07gxzzhq': {
      'en': 'Use a social platform to continue',
      'id': 'Gunakan platform sosial untuk melanjutkan',
      'ms': 'Gunakan platform sosial untuk meneruskan',
      'pt': 'Use uma plataforma social para continuar',
    },
    'ysqhbhpe': {
      'en': 'Already have an account?',
      'id': 'Sudah memiliki akun?',
      'ms': 'Sudah mempunyai akaun?',
      'pt': 'já tem uma conta?',
    },
    'ud92zl8z': {
      'en': 'Log In',
      'id': 'Gabung',
      'ms': 'Log masuk',
      'pt': 'Conecte-se',
    },
    'zuuuklky': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
      'pt': 'Lar',
    },
  },
  // forgotPassword
  {
    '3hcuc8v6': {
      'en': 'Forgot Password',
      'id': 'Tidak ingat kata sandi',
      'ms': 'Lupa kata laluan',
      'pt': 'Esqueceu sua senha',
    },
    'sjjd1jb9': {
      'en':
          'Don\'t remember your password? Enter the email associated with your account below and we will send you a new link.',
      'id':
          'Tidak ingat kata sandi Anda? Masukkan email yang terkait dengan akun Anda di bawah ini dan kami akan mengirimkan tautan baru kepada Anda.',
      'ms':
          'Tidak ingat kata laluan anda? Masukkan e-mel yang dikaitkan dengan akaun anda di bawah dan kami akan menghantar pautan baharu kepada anda.',
      'pt':
          'Não lembra sua senha? Digite o e-mail associado à sua conta abaixo e enviaremos um novo link.',
    },
    'tzm5opaa': {
      'en': 'Email Address',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
      'pt': 'Endereço de email',
    },
    'uvsotzng': {
      'en': 'Please enter a valid email...',
      'id': 'Tolong masukkan email yang benar...',
      'ms': 'Sila masukkan e-mel yang sah...',
      'pt': 'Por favor digite um email válido...',
    },
    '3sdzjivm': {
      'en': 'Send Reset Link',
      'id': 'Kirim Ulang Tautan',
      'ms': 'Hantar Pautan Tetapan Semula',
      'pt': 'Enviar link de redefinição',
    },
    '8p6xd6cl': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
      'pt': 'Lar',
    },
  },
  // Home
  {
    '3bi54x5g': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
      'pt': 'Painel',
    },
    'nnv46x35': {
      'en': 'Below is a summary of activities',
      'id': 'Di bawah ini adalah rangkuman kegiatan',
      'ms': 'Di bawah adalah ringkasan aktiviti',
      'pt': 'Abaixo está um resumo das atividades',
    },
    'jqevo63s': {
      'en': 'Registered animals',
      'id': 'Hewan terdaftar',
      'ms': 'Haiwan berdaftar',
      'pt': 'Animais Registrados',
    },
    'd0r4w3cc': {
      'en': '24',
      'id': '24',
      'ms': '24',
      'pt': '24',
    },
    '8vot9bzj': {
      'en': 'Registered Locations',
      'id': 'Lokasi Terdaftar',
      'ms': 'Lokasi Berdaftar',
      'pt': 'Locais Registrados',
    },
    '463rfkem': {
      'en': '3,200',
      'id': '3.200',
      'ms': '3,200',
      'pt': '3.200',
    },
    'saxskj92': {
      'en': 'Disabled Locations',
      'id': 'Lokasi Dinonaktifkan',
      'ms': 'Lokasi Kurang Upaya',
      'pt': 'Locais Desativados',
    },
    '2wlrr5lg': {
      'en': '4300',
      'id': '4300',
      'ms': '4300',
      'pt': '4300',
    },
    'kphqz3hi': {
      'en': 'Activities',
      'id': 'Kegiatan',
      'ms': 'Aktiviti',
      'pt': 'Atividades',
    },
    'xlzf8qqx': {
      'en': 'UI Design Team',
      'id': 'Tim Desain UI',
      'ms': 'Pasukan Reka Bentuk UI',
      'pt': 'Equipe de design de interface do usuário',
    },
    'zt3s5l2s': {
      'en': '4 Members',
      'id': '4 Anggota',
      'ms': '4 Ahli',
      'pt': '4 membros',
    },
    'puy8obok': {
      'en': 'Contract Activity',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
      'pt': 'Atividade Contratual',
    },
    'zlovh0zt': {
      'en': 'Below is an a summary of activity.',
      'id': 'Berikut rangkuman kegiatannya.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
      'pt': 'Abaixo está um resumo da atividade.',
    },
    'g1uaaovn': {
      'en': 'Customer Activity',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
      'pt': 'Atividade do cliente',
    },
    'e5q3ows1': {
      'en': 'Below is an a summary of activity.',
      'id': 'Berikut rangkuman kegiatannya.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
      'pt': 'Abaixo está um resumo da atividade.',
    },
    'uj7jsxmo': {
      'en': 'Contract Activity',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
      'pt': 'Atividade Contratual',
    },
    'hkk2zmjw': {
      'en': 'Below is an a summary of activity.',
      'id': 'Berikut rangkuman kegiatannya.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
      'pt': 'Abaixo está um resumo da atividade.',
    },
    'jkgae0vc': {
      'en': 'Customer Activity',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
      'pt': 'Atividade do cliente',
    },
    'g4os7kcp': {
      'en': 'Below is an a summary of activity.',
      'id': 'Berikut rangkuman kegiatannya.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
      'pt': 'Abaixo está um resumo da atividade.',
    },
    'y24lcr13': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
      'pt': 'Painel',
    },
    'xdxbdj20': {
      'en': '__',
      'id': '__',
      'ms': '__',
      'pt': '__',
    },
  },
  // animalDetails
  {
    'obyrn1rb': {
      'en': 'Animal Name',
      'id': 'Nama Hewan',
      'ms': 'Nama Haiwan',
      'pt': 'Nome do Animal',
    },
    'ecbeopja': {
      'en': 'Breed',
      'id': 'Keturunan',
      'ms': 'baka',
      'pt': 'Raça',
    },
    'xf6clrz6': {
      'en': 'Head of Procurement',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
      'pt': 'Chefe de Compras',
    },
    'kl55bl1c': {
      'en': 'Local',
      'id': 'Lokal',
      'ms': 'Tempatan',
      'pt': 'Local',
    },
    'nh9bkr5i': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
      'pt': 'ACME Co.',
    },
    'dkyygm1d': {
      'en': 'measurements',
      'id': 'Pengukuran diambil',
      'ms': 'Pengukuran diambil',
      'pt': 'Medidas tomadas',
    },
    'p82rjlf3': {
      'en': 'Alexandria Smith',
      'id': 'Aleksandria Smith',
      'ms': 'Alexandria Smith',
      'pt': 'Alexandria Smith',
    },
    '2s53b50t': {
      'en': '1m ago',
      'id': '1 m yang lalu',
      'ms': '1m lalu',
      'pt': '1m atrás',
    },
    'rnaiavvh': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'id':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elite, sed do eiusmod tempor insidedunt ut work et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'ms':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laboure et dolore magna aliqua. Untuk meminimumkan veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'pt':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea comodo consequat.',
    },
    'suvzdvvk': {
      'en': 'View Company',
      'id': 'Lihat Perusahaan',
      'ms': 'Lihat Syarikat',
      'pt': 'Ver empresa',
    },
    '9t913b44': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
      'pt': 'Lar',
    },
  },
  // searchPage
  {
    'ao46xsuv': {
      'en': 'Add Members',
      'id': 'Tambahkan Anggota',
      'ms': 'Tambah Ahli',
      'pt': 'Adicionar membros',
    },
    'g8rv8zhr': {
      'en': 'Search members...',
      'id': 'Telusuri anggota...',
      'ms': 'Cari ahli...',
      'pt': 'Pesquisar membros...',
    },
    'op7ngmsb': {
      'en': 'Option 1',
      'id': 'Pilihan 1',
      'ms': 'Pilihan 1',
      'pt': 'Opção 1',
    },
    '5x8u4g0u': {
      'en': 'Add Members',
      'id': 'Tambahkan Anggota',
      'ms': 'Tambah Ahli',
      'pt': 'Adicionar membros',
    },
    '4cek35uo': {
      'en': 'View',
      'id': 'Melihat',
      'ms': 'Lihat',
      'pt': 'Visualizar',
    },
    'mvx2sb5k': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
      'pt': 'Lar',
    },
  },
  // editProfile
  {
    'mk8nnw94': {
      'en': 'Change Photo',
      'id': 'Ubah Foto',
      'ms': 'Tukar gambar',
      'pt': 'Mudar foto',
    },
    '4no7ue4a': {
      'en': 'Your Name',
      'id': 'Namamu',
      'ms': 'Nama awak',
      'pt': 'Seu nome',
    },
    '2rqce1pj': {
      'en': 'The email associated with this account is:',
      'id': 'Email yang terkait dengan akun ini adalah:',
      'ms': 'E-mel yang dikaitkan dengan akaun ini ialah:',
      'pt': 'O e-mail associado a esta conta é:',
    },
    'rr8ksatz': {
      'en': 'Save Changes',
      'id': 'Simpan perubahan',
      'ms': 'Simpan Perubahan',
      'pt': 'Salvar alterações',
    },
    '20uycztj': {
      'en': 'Edit Profile',
      'id': 'Sunting profil',
      'ms': 'Sunting profil',
      'pt': 'Editar Perfil',
    },
  },
  // Main_animalList
  {
    'n99lg1qh': {
      'en': 'Animals',
      'id': 'Hewan',
      'ms': 'Haiwan',
      'pt': 'Animais',
    },
    'lvnskphp': {
      'en': 'All',
      'id': 'Semua',
      'ms': 'Semua',
      'pt': 'Todos',
    },
    'cjgns112': {
      'en': '20',
      'id': '20',
      'ms': '20',
      'pt': '20',
    },
    'qh2ock0d': {
      'en': 'Actives',
      'id': 'Aktif',
      'ms': 'Aktif',
      'pt': 'Ativos',
    },
    'dqhomqt2': {
      'en': '20',
      'id': '20',
      'ms': '20',
      'pt': '20',
    },
    's7xebw09': {
      'en': 'Inactive',
      'id': 'Tidak aktif',
      'ms': 'Tidak aktif',
      'pt': 'Inativos',
    },
    'w5uf0wv5': {
      'en': '20',
      'id': '20',
      'ms': '20',
      'pt': '20',
    },
    '4xv5ljk5': {
      'en': 'Animals',
      'id': 'Hewan',
      'ms': 'Haiwan',
      'pt': 'animais',
    },
    '3ourv2w9': {
      'en': '__',
      'id': '__',
      'ms': '__',
      'pt': '__',
    },
  },
  // Main_profilePage
  {
    'qrxn5crt': {
      'en': 'My Profile',
      'id': 'Profil saya',
      'ms': 'Profil saya',
      'pt': 'Meu perfil',
    },
    'v1hh7jlp': {
      'en': 'Switch to Dark Mode',
      'id': 'Beralih ke Mode Gelap',
      'ms': 'Tukar kepada Mod Gelap',
      'pt': 'Alternar para o modo escuro',
    },
    'sh7q15l6': {
      'en': 'Switch to Light Mode',
      'id': 'Beralih ke Mode Cahaya',
      'ms': 'Tukar kepada Mod Cahaya',
      'pt': 'Alternar para o modo claro',
    },
    'fyxsf6vn': {
      'en': 'Account Settings',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
      'pt': 'Configurações de Conta',
    },
    'h43llaan': {
      'en': 'Change Password',
      'id': 'Ganti kata sandi',
      'ms': 'Tukar kata laluan',
      'pt': 'Alterar a senha',
    },
    'b1lw0hfu': {
      'en': 'Edit Profile',
      'id': 'Sunting profil',
      'ms': 'Sunting profil',
      'pt': 'Editar Perfil',
    },
    'abqf147c': {
      'en': 'Log Out',
      'id': 'Keluar',
      'ms': 'Log keluar',
      'pt': 'Sair',
    },
    'o3dp9tss': {
      'en': '__',
      'id': '__',
      'ms': '__',
      'pt': '__',
    },
  },
  // Main_measurements
  {
    'v8uya9kq': {
      'en': 'Measurements',
      'id': 'Pengukuran',
      'ms': 'Pengukuran',
      'pt': 'Medidas',
    },
    '03r1gsqr': {
      'en': 'All',
      'id': 'Semua',
      'ms': 'Semua',
      'pt': 'Todas',
    },
    'h9a0s3vp': {
      'en': 'June Williamson',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
      'pt': 'June Williamson',
    },
    '4zchoki9': {
      'en': 'Sr. Account Manager',
      'id': 'Manajer Akun Sr',
      'ms': 'Tuan Pengurus Akaun',
      'pt': 'Gerente de contas sênior',
    },
    'fwx5wfry': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
      'pt': 'HealthAi',
    },
    'zgr4urqv': {
      'en': 'Active',
      'id': 'Aktif',
      'ms': 'Aktif',
      'pt': 'Ativas',
    },
    'z6vhpkfa': {
      'en': 'James Wiseman',
      'id': 'James Wisman',
      'ms': 'James Wiseman',
      'pt': 'James Wiseman',
    },
    'wk61zfbe': {
      'en': 'Account Manager',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
      'pt': 'Gerente de contas',
    },
    'z3v80ljl': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
      'pt': 'HealthAi',
    },
    '7a9y8b2r': {
      'en': 'Inactive',
      'id': 'Tidak aktif',
      'ms': 'Tidak aktif',
      'pt': 'Inativas',
    },
    'bn4znl0y': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
      'pt': 'Randy Alcorn',
    },
    'r6z6wvgv': {
      'en': 'Head of Procurement',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
      'pt': 'Chefe de Compras',
    },
    'tuv7iex9': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
      'pt': 'ACME Co.',
    },
    'n5lg44n8': {
      'en': 'Elena Williams',
      'id': 'Elena Williams',
      'ms': 'Elena Williams',
      'pt': 'Elena Williams',
    },
    '2fpbiwrp': {
      'en': 'Head of Product & Innovation',
      'id': 'Kepala Produk & Inovasi',
      'ms': 'Ketua Produk & Inovasi',
      'pt': 'Head de Produto e Inovação',
    },
    'csosj0dl': {
      'en': 'Robin HQ',
      'id': 'Markas Besar Robin',
      'ms': 'Robin HQ',
      'pt': 'Robin HQ',
    },
    'cdong7zk': {
      'en': 'Measurements',
      'id': 'Pengukuran',
      'ms': 'Pengukuran',
      'pt': 'Medidas',
    },
    '26zyhyb8': {
      'en': '__',
      'id': '__',
      'ms': '__',
      'pt': '__',
    },
  },
  // Main_Locals
  {
    '2wveoe3e': {
      'en': 'Locals',
      'id': 'Penduduk setempat',
      'ms': 'Orang tempatan',
      'pt': 'Locais',
    },
    'r3xsq2wl': {
      'en': 'All',
      'id': 'Semua',
      'ms': 'Semua',
      'pt': 'Todos',
    },
    '1pk3815e': {
      'en': '20',
      'id': '20',
      'ms': '20',
      'pt': '20',
    },
    '38018wqk': {
      'en': 'Actives',
      'id': 'Aktif',
      'ms': 'Aktif',
      'pt': 'Ativos',
    },
    'g3lokked': {
      'en': '20',
      'id': '20',
      'ms': '20',
      'pt': '20',
    },
    '1xcom3zz': {
      'en': 'Inactives',
      'id': 'Tidak aktif',
      'ms': 'Tidak aktif',
      'pt': 'Inativos',
    },
    't8zsz239': {
      'en': '20',
      'id': '20',
      'ms': '20',
      'pt': '20',
    },
    'um59l5by': {
      'en': 'Locals',
      'id': 'Penduduk setempat',
      'ms': 'Orang tempatan',
      'pt': 'Locais',
    },
    'wtc64zzu': {
      'en': '__',
      'id': '__',
      'ms': '__',
      'pt': '__',
    },
  },
  // localDetails
  {
    'jvf45pu2': {
      'en': 'Local Name',
      'id': 'Nama Lokal',
      'ms': 'Nama Tempatan',
      'pt': 'Nome do Local',
    },
    'ev2b8emn': {
      'en': 'Local Description',
      'id': 'Deskripsi Lokal',
      'ms': 'Penerangan Tempatan',
      'pt': 'Descrição local',
    },
    'lb8euro4': {
      'en': 'measurements',
      'id': 'Pengukuran diambil',
      'ms': 'Pengukuran diambil',
      'pt': 'Medidas tomadas',
    },
    'uc8qci71': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
      'pt': 'Detalhes do contrato',
    },
    't87n59x9': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
      'pt':
          'Detalhes adicionais sobre este contrato e quem está trabalhando nele neste cartão!',
    },
    'd59tz673': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
      'pt': 'Marcar como Completo',
    },
    'vq6l3c2u': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
      'pt': 'Lar',
    },
  },
  // modal_Welcome
  {
    '00flvi93': {
      'en': 'Congratulations!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
      'pt': 'Parabéns!',
    },
    'fmzceh74': {
      'en': 'A new activit has been finality.',
      'id': 'Sebuah aktivitas baru telah menjadi finalitas.',
      'ms': 'Satu aktiviti baru telah muktamad.',
      'pt': 'Uma nova atividade foi finalizada.',
    },
    'g8q2u55w': {
      'en': 'Continue',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
      'pt': 'Continuar',
    },
  },
  // modal_Message
  {
    'wa4vkne2': {
      'en': 'Atention!',
      'id': 'Perhatian!',
      'ms': 'Perhatian!',
      'pt': 'Atenção!',
    },
    '3hf2ocig': {
      'en': 'You realy will delete this item?',
      'id': 'Anda benar-benar akan menghapus item ini?',
      'ms': 'Anda benar-benar akan memadamkan item ini?',
      'pt': 'Você realmente vai deletar este item?',
    },
    'q0jvi1lp': {
      'en': 'Yes',
      'id': 'Ya',
      'ms': 'ya',
      'pt': 'Sim',
    },
    'oo4y13nf': {
      'en': 'No',
      'id': 'TIDAK',
      'ms': 'Tidak',
      'pt': 'Não',
    },
  },
  // editProfilePhoto
  {
    '6bnefz1c': {
      'en': 'Change Photo',
      'id': '',
      'ms': '',
      'pt': 'Mudar foto',
    },
    'yaxe7q8v': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'id': '',
      'ms': '',
      'pt':
          'Carregue uma nova foto abaixo para alterar seu avatar visto por outras pessoas.',
    },
    're4x0sz7': {
      'en': 'Upload Image',
      'id': '',
      'ms': '',
      'pt': 'Enviar Imagem',
    },
    'sr54fsk6': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
      'pt': 'Salvar alterações',
    },
  },
  // createComment
  {
    'l2jlnhye': {
      'en': 'Create Note',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
      'pt': 'Criar nota',
    },
    'd6yfe8tj': {
      'en': 'Find members by searching below',
      'id': 'Temukan anggota dengan mencari di bawah ini',
      'ms': 'Cari ahli dengan mencari di bawah',
      'pt': 'Encontre membros pesquisando abaixo',
    },
    'p3rj5ra0': {
      'en': 'Ricky Rodriguez',
      'id': 'Ricky Rodriguez',
      'ms': 'Ricky Rodriguez',
      'pt': 'Ricky Rodriguez',
    },
    '9gf6o5ss': {
      'en': 'Enter your note here...',
      'id': 'Masukkan catatan Anda di sini...',
      'ms': 'Masukkan nota anda di sini...',
      'pt': 'Digite sua nota aqui...',
    },
    'farrki57': {
      'en': 'Create Note',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
      'pt': 'Criar nota',
    },
  },
  // mobileNav
  {
    'sy0pxvma': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
      'pt': 'Painel',
    },
    't5c3aiuy': {
      'en': 'Measurements',
      'id': 'Pengukuran',
      'ms': 'Pengukuran',
      'pt': 'Medidas',
    },
    'nkz3c58a': {
      'en': 'Animals',
      'id': 'Hewan',
      'ms': 'Haiwan',
      'pt': 'Animais',
    },
    '1mkyyjwj': {
      'en': 'Locals',
      'id': 'Penduduk setempat',
      'ms': 'Orang tempatan',
      'pt': 'Locais',
    },
    'eg79coc6': {
      'en': 'Profile',
      'id': 'Profil',
      'ms': 'Profil',
      'pt': 'Perfil',
    },
  },
  // webNav
  {
    'xai8ocja': {
      'en': 'Search',
      'id': 'Mencari',
      'ms': 'Cari',
      'pt': 'Procurar',
    },
    'yg07zi4c': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
      'pt': 'Painel',
    },
    '5s0d776i': {
      'en': 'Measurements',
      'id': 'Pengukuran',
      'ms': 'Pengukuran',
      'pt': 'Medidas',
    },
    'lbojdpxg': {
      'en': 'Animals',
      'id': 'Hewan',
      'ms': 'Haiwan',
      'pt': 'Animais',
    },
    '9pjba90p': {
      'en': 'Locals',
      'id': 'Penduduk setempat',
      'ms': 'Orang tempatan',
      'pt': 'Locais',
    },
    '01nu9cy0': {
      'en': 'Profile',
      'id': 'Profil',
      'ms': 'Profil',
      'pt': 'Perfil',
    },
  },
  // commandPalette
  {
    'jt9g5o8v': {
      'en': 'Search platform...',
      'id': 'Telusuri platform...',
      'ms': 'Platform carian...',
      'pt': 'Plataforma de busca...',
    },
    'b3bd9y8w': {
      'en': 'Search',
      'id': 'Mencari',
      'ms': 'Cari',
      'pt': 'Procurar',
    },
    'pw6kvl1f': {
      'en': 'Quick Links',
      'id': 'tautan langsung',
      'ms': 'Pautan Pantas',
      'pt': 'Links Rápidos',
    },
    'gckukxjv': {
      'en': 'Find Local',
      'id': 'Temukan Lokal',
      'ms': 'Cari Tempatan',
      'pt': 'Encontrar local',
    },
    'x6qiocjw': {
      'en': 'Find Measurement',
      'id': 'Temukan Pengukuran',
      'ms': 'Cari Pengukuran',
      'pt': 'Encontrar medição',
    },
    'zsq8vj02': {
      'en': 'Find Animal',
      'id': 'Temukan Hewan',
      'ms': 'Cari Haiwan',
      'pt': 'Encontrar animal',
    },
    'iqxwv326': {
      'en': 'New Animal',
      'id': 'Hewan Baru',
      'ms': 'Haiwan Baru',
      'pt': 'Novo animal',
    },
    '2w3eyztm': {
      'en': 'New Measurement',
      'id': 'Pengukuran Baru',
      'ms': 'Pengukuran Baru',
      'pt': 'Nova Medição',
    },
    's60yfg0g': {
      'en': 'New Local',
      'id': 'Lokal Baru',
      'ms': 'Tempatan Baharu',
      'pt': 'Novo local',
    },
    'lwrh59bb': {
      'en': 'Recent Searches',
      'id': 'pencarian terkini',
      'ms': 'Carian Terkini',
      'pt': 'pesquisas recentes',
    },
    'o6lqlfr1': {
      'en': 'Newport Financ',
      'id': 'Keuangan Newport',
      'ms': 'Kewangan Newport',
      'pt': 'Newport Financ',
    },
    '6zpaywwg': {
      'en': 'Harry Styles',
      'id': 'Harry Styles',
      'ms': 'gaya Harry',
      'pt': 'Estilos de Harry',
    },
  },
  // createLocal
  {
    'hijcw5k2': {
      'en': 'New Local',
      'id': 'Lokal Baru',
      'ms': 'Tempatan Baharu',
      'pt': 'Novo Local',
    },
    'ke0t4kdm': {
      'en': 'Use the form below to create localion informations.',
      'id': 'Gunakan formulir di bawah ini untuk membuat informasi lokal.',
      'ms': 'Gunakan borang di bawah untuk membuat maklumat setempat.',
      'pt': 'Use o formulário abaixo para criar informações de localização.',
    },
    '6gqb3x8o': {
      'en': 'Enter the name of your location here...',
      'id': 'Masukkan nama lokasi Anda di sini...',
      'ms': 'Masukkan nama lokasi anda di sini...',
      'pt': 'Digite o nome do seu local aqui...',
    },
    'btu84ipb': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'k0mq7usa': {
      'en': 'Enter the type of your location here...',
      'id': 'Masukkan jenis lokasi Anda di sini...',
      'ms': 'Masukkan jenis lokasi anda di sini...',
      'pt': 'Digite o tipo de sua localização aqui...',
    },
    'hr0y4wav': {
      'en': 'Enter the description of your location here...',
      'id': 'Masukkan deskripsi lokasi Anda di sini...',
      'ms': 'Masukkan perihalan lokasi anda di sini...',
      'pt': 'Digite a descrição da sua localização aqui...',
    },
    '85w7o0o5': {
      'en': 'Upload a new photo below.',
      'id': 'Unggah foto baru di bawah ini.',
      'ms': 'Muat naik foto baharu di bawah.',
      'pt': 'Carregue uma nova foto abaixo.',
    },
    'akch3obg': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
      'pt': 'Salvar alterações',
    },
  },
  // createAnimal
  {
    '8z956lho': {
      'en': 'New Animal',
      'id': 'Hewan Baru',
      'ms': 'Haiwan Baru',
      'pt': 'Novo animal',
    },
    'id5r9htr': {
      'en': 'Use the form below to create animal informations.',
      'id': 'Gunakan formulir di bawah ini untuk membuat informasi hewan.',
      'ms': 'Gunakan borang di bawah untuk mencipta maklumat haiwan.',
      'pt': 'Use o formulário abaixo para criar informações sobre animais.',
    },
    'd7kxwx6w': {
      'en': 'Enter the name of your animal here...',
      'id': 'Masukkan nama hewan Anda di sini...',
      'ms': 'Masukkan nama haiwan anda di sini...',
      'pt': 'Digite aqui o nome do seu animal...',
    },
    'fb2vuj5i': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'tqwg4ljg': {
      'en': 'Enter the type of your animal here...',
      'id': 'Masukkan jenis hewan Anda di sini...',
      'ms': 'Masukkan jenis haiwan anda di sini...',
      'pt': 'Digite aqui o tipo do seu animal...',
    },
    'jizrw648': {
      'en': 'Enter the description of your animal here...',
      'id': 'Masukkan deskripsi hewan Anda di sini...',
      'ms': 'Masukkan perihalan haiwan anda di sini...',
      'pt': 'Digite aqui a descrição do seu animal...',
    },
    '65gyie3b': {
      'en': 'Upload a new photo below.',
      'id': 'Unggah foto baru di bawah ini.',
      'ms': 'Muat naik foto baharu di bawah.',
      'pt': 'Carregue uma nova foto abaixo.',
    },
    'siso0l3b': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
      'pt': 'Salvar alterações',
    },
  },
  // createMeasurements
  {
    'mgig2f53': {
      'en': 'New Measure',
      'id': 'Ukuran Baru',
      'ms': 'Ukuran Baharu',
      'pt': 'Nova Medida',
    },
    '49dtg7an': {
      'en': 'Use the form below to create localion informations.',
      'id': 'Gunakan formulir di bawah ini untuk membuat informasi lokal.',
      'ms': 'Gunakan borang di bawah untuk membuat maklumat setempat.',
      'pt': 'Use o formulário abaixo para criar informações de localização.',
    },
    '6mp8cgav': {
      'en': 'Enter the name of your location here...',
      'id': 'Masukkan nama lokasi Anda di sini...',
      'ms': 'Masukkan nama lokasi anda di sini...',
      'pt': 'Digite o nome do seu local aqui...',
    },
    'fl8cz2zh': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'f447xw3n': {
      'en': 'Enter the type of your location here...',
      'id': 'Masukkan jenis lokasi Anda di sini...',
      'ms': 'Masukkan jenis lokasi anda di sini...',
      'pt': 'Digite o tipo de sua localização aqui...',
    },
    'gf83jvm1': {
      'en': 'Enter the description of your location here...',
      'id': 'Masukkan deskripsi lokasi Anda di sini...',
      'ms': 'Masukkan perihalan lokasi anda di sini...',
      'pt': 'Digite a descrição da sua localização aqui...',
    },
    'z8sv5hw3': {
      'en': 'Upload a new photo below.',
      'id': 'Unggah foto baru di bawah ini.',
      'ms': 'Muat naik foto baharu di bawah.',
      'pt': 'Carregue uma nova foto abaixo.',
    },
    'uusyek4r': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
      'pt': 'Salvar alterações',
    },
  },
  // Miscellaneous
  {
    '3rkeihuq': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'id':
          'Untuk mengambil gambar atau video, aplikasi ini memerlukan izin untuk mengakses kamera.',
      'ms':
          'Untuk mengambil gambar atau video, apl ini memerlukan kebenaran untuk mengakses kamera.',
      'pt':
          'Para tirar uma foto ou gravar um vídeo, este aplicativo requer permissão para acessar a câmera.',
    },
    'li6h4zw2': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'id':
          'Untuk mengunggah data, aplikasi ini memerlukan izin untuk mengakses perpustakaan foto.',
      'ms':
          'Untuk memuat naik data, apl ini memerlukan kebenaran untuk mengakses pustaka foto.',
      'pt':
          'Para fazer upload de dados, este aplicativo requer permissão para acessar a biblioteca de fotos.',
    },
    'qti82aan': {
      'en':
          'To make the most of our app, we need your permission to send you notifications.',
      'id': '',
      'ms': '',
      'pt': '',
    },
    '65e2tfs2': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'ddazihx4': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'db03cpjj': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'fdb9078p': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    '80ouzj9q': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    '6rzhptp9': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'ce8c4ty0': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'iqnguzaf': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    '49bav1uh': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'kcvqa08x': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'dqrzd6sq': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'dpqtohyf': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'v01vf71s': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'gcv6def1': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'um9es99m': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'o4enbz4j': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    '8z4tvfh7': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    '2ybzla8x': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'd1wdf5i1': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'jzug8w91': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    '2py80kgi': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'p6lsrh2a': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
    'ne8cclp9': {
      'en': '',
      'id': '',
      'ms': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
