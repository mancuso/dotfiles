([ "$AUTO_SHELL" = "" ] && AUTO_SHELL=`bash -c 'echo bash' 2>/dev/null || ksh -c 'echo ksh' 2>/dev/null || ( >&2 echo "Unable to find supported shell (bash or ksh). Please, define full path to your shell in environment variable AUTO_SHELL and retry installation" && exit 2 )`; "${AUTO_SHELL}" -c "AUTO_SHELL='${AUTO_SHELL}'; export AUTO_SHELL; PERL_LWP_SSL_VERIFY_HOSTNAME=0; export PERL_LWP_SSL_VERIFY_HOSTNAME; download_with_perl() { perl -MLWP::Simple -e '\$c=get \$ARGV[0]; exit 1 unless length \$c; print \$c' \"\$1\"; }; download_with_wget() { wget -O - --no-check-certificate --tries=1 --read-timeout=30 \"\$1\"; }; download_with_curl() { curl --insecure --fail --retry 1 \"\$1\"; }; "'if [ "${DT}" != "" ]; then >&2 echo "Using download tool \"${DT}\" from environment"; elif wget --version 2>/dev/null >/dev/null; then DT=wget; elif curl file:///dev/null 2>/dev/null >/dev/null; then DT=curl; elif perl -MLWP::Simple -e "" 2>/dev/null; then DT=perl; else >&2 echo "Cannot find download tool - please install wget, curl or perl with module LWP::Simple or use other installation method"; exit 18; fi; export DT; [ "${DEBUG}" != "" ] && >&2 printf "AUTO_SHELL=\"%s\"\nDT=\"%s\"\n" "${AUTO_SHELL}" "${DT}"; x() { P=$1; shift; >&2 printf "\nDownloading installation data from Orion Poller..."; while [ "$#" -gt "0" ]; do u=$1; shift; printf "URL=\"%s\"\nexport URL\n" "$u"; if download_with_$DT $u$P 2>/dev/null; then >&2 echo; return; fi; >&2 printf "."; done; >&2 echo; >&2 echo "Unable to connect to Orion Poller to download agent package. Please use an alternate deployment method, such as Add Node wizard."; >&2 echo "See http://www.solarwinds.com/documentation/helpLoader.aspx?lang=en&topic=OrionAgentDeployAgentTop"; exit 3; }; X=`x /Orion/AgentManagement/DownloadLinuxOnlineInstallScript.ashx?requestId=7fbef49f-d427-4634-82b8-2f01f57bc284 https://solappprd02vm https://142.240.22.76 https://sysmonitor.mississauga.ca https://sysmonitor.mississauga.ca:443 https://sysmonitor.mississauga.ca:443 https://SOLAPPPRD01VM:443 https://solappprd01vm https://142.240.22.61 https://142.240.22.20 https://169.254.69.80`||exit $?; "${AUTO_SHELL}" -c "[ \"${DEBUG}\" != \"\" ] && set -x; ${X}"; ')
