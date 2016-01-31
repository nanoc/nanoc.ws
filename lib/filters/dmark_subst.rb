Class.new(Nanoc::Filter) do
  identifier :dmark_subst

  SUDO_GEM_CONTENT = 'If the %command{<cmd>} command fails with a permission error, you likely have to prefix the command with %kbd{sudo}. Do not use %command{sudo} until you have tried the command without it; using %command{sudo} when not appropriate will damage your RubyGems installation.'

  SUDO_GEM_INSTALL_CONTENT = SUDO_GEM_CONTENT.gsub('<cmd>', 'gem install')

  SUDO_GEM_UPDATE_SYSTEM_CONTENT = SUDO_GEM_CONTENT.gsub('<cmd>', 'gem update --system')

  def run(content, params = {})
    content
      .gsub('<sudo-gem-install>', SUDO_GEM_INSTALL_CONTENT)
      .gsub('<sudo-gem-update-system>', SUDO_GEM_UPDATE_SYSTEM_CONTENT)
  end
end