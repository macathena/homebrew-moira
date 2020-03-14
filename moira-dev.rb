class MoiraDev < Formula
  desc "Clients for the Athena Service Management System (developer)"
  homepage "https://github.mit.edu/ops/moira"
  url "git@github.mit.edu:ops/moira.git", :using => :git
  version "0"

  depends_on :macos => :el_capitan
  depends_on "hesiod"
  depends_on "krb5"
  conflicts_with "moira", :because => "moira-dev is moira"

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
      --with-com_err
      --without-krb4
      --with-krb5=#{Formula["krb5"].opt_prefix}
      --with-hesiod=#{Formula["hesiod"].opt_prefix}
      --without-zephyr
      --without-oracle
      --without-afs
      --disable-rpath
      --mandir=#{man}
    ]

    # Build et
    cd "moira/util/et" do
      system "./configure"
      system "make"
    end

    # Build moira core
    cd "moira" do
      system "./configure", *args
      system "make"
      system "make", "install"
    end

    # Override moira-specific system tool names
    cd bin do
      mv "chfn", "chfn.moira"
      mv "chsh", "chsh.moira"
    end

    # Build manpage documentation
    cd man1 do
      mv "chsh.1", "chsh.moira.1"
      mv "chfn.1", "chfn.moira.1"
    end
  end

  test do
    system "#{bin}/blanche", "ops", "-i", "-noauth"
    system "#{bin}/eunice", "enis", "-noauth"
    system "#{bin}/mitch", "Machines/IST", "-noauth"
    system "#{bin}/qy", "giql", "-s"
    system "#{bin}/stella", "ist", "-noauth"
  end
end
