package com.tecunhuman.vagrant;

import javax.script.ScriptContext;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

public class App 
{
    public static void main( String[] args ) throws ScriptException
    {
        ScriptEngineManager manager = new ScriptEngineManager();
        ScriptEngine jRubyEngine = manager.getEngineByName("jruby");

        ScriptContext context = jRubyEngine.getContext();
        context.setAttribute(ScriptEngine.ARGV, args, ScriptContext.ENGINE_SCOPE);

        jRubyEngine.eval(
            "require 'rubygems'\n" +
            "version = '>= 0'\n" +
            "if ARGV.first =~ /^_(.*)_$/ and Gem::Version.correct? $1 then\n" +
            "    version = $1\n" +
            "    ARGV.shift\n" +
            "end\n" +
            "gem 'vagrant', version\n" +
            "load Gem.bin_path('vagrant', 'vagrant', version)\n"
        );
    }
}
