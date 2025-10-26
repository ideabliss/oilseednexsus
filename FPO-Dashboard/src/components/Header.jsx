import { useState } from 'react'

export default function Header({ setSidebarOpen }) {
  const [searchQuery, setSearchQuery] = useState('')

  return (
    <header className="bg-gradient-to-r from-white via-blue-50 to-green-50 shadow-xl border-b border-gray-200 backdrop-blur-sm">
      <div className="flex items-center justify-between px-6 py-4">
        {/* Mobile menu button */}
        <button
          className="lg:hidden p-3 rounded-2xl text-gray-600 hover:text-white hover:bg-gradient-to-r hover:from-blue-500 hover:to-green-500 transition-all duration-300 shadow-lg hover:shadow-xl transform hover:scale-110"
          onClick={() => setSidebarOpen(true)}
        >
          <span className="text-xl">☰</span>
        </button>

        {/* Enhanced Search */}
        <div className="flex-1 max-w-2xl mx-6">
          <div className="relative">
            <input
              type="text"
              placeholder="Search farmers, orders, crops, analytics..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="w-full pl-12 pr-6 py-4 bg-white/80 backdrop-blur-sm border-2 border-gray-200 rounded-2xl focus:ring-4 focus:ring-blue-500/20 focus:border-blue-500 transition-all duration-300 shadow-lg hover:shadow-xl text-gray-700 placeholder-gray-500 font-medium"
            />
            <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
              <div className="bg-gradient-to-r from-blue-500 to-green-500 p-2 rounded-xl">
                <span className="text-white text-lg">🔍</span>
              </div>
            </div>
            {searchQuery && (
              <button 
                onClick={() => setSearchQuery('')}
                className="absolute inset-y-0 right-0 pr-4 flex items-center text-gray-400 hover:text-gray-600"
              >
                <span className="text-lg">✕</span>
              </button>
            )}
          </div>
        </div>

        {/* Enhanced Right side */}
        <div className="flex items-center space-x-4">
          {/* Weather Widget */}
          <div className="hidden md:flex items-center bg-white/80 backdrop-blur-sm rounded-2xl px-4 py-2 shadow-lg border border-gray-200">
            <span className="text-2xl mr-2">☀️</span>
            <div>
              <p className="text-sm font-bold text-gray-900">28°C</p>
              <p className="text-xs text-gray-500">Sunny</p>
            </div>
          </div>

          {/* Enhanced Notifications */}
          <button className="p-3 text-gray-600 hover:text-white hover:bg-gradient-to-r hover:from-orange-500 hover:to-red-500 rounded-2xl relative transition-all duration-300 shadow-lg hover:shadow-xl transform hover:scale-110 bg-white/80 backdrop-blur-sm border border-gray-200">
            <span className="text-xl">🔔</span>
            <span className="absolute -top-1 -right-1 w-6 h-6 bg-gradient-to-r from-red-500 to-pink-500 text-white text-xs rounded-full flex items-center justify-center font-bold shadow-lg animate-pulse">
              3
            </span>
          </button>

          {/* Quick Actions */}
          <button className="p-3 text-gray-600 hover:text-white hover:bg-gradient-to-r hover:from-purple-500 hover:to-indigo-500 rounded-2xl transition-all duration-300 shadow-lg hover:shadow-xl transform hover:scale-110 bg-white/80 backdrop-blur-sm border border-gray-200">
            <span className="text-xl">⚡</span>
          </button>

          {/* Enhanced Profile */}
          <div className="flex items-center space-x-3 bg-white/80 backdrop-blur-sm rounded-2xl px-4 py-2 shadow-lg border border-gray-200 hover:shadow-xl transition-all duration-300">
            <div className="w-10 h-10 bg-gradient-to-r from-blue-500 to-green-500 rounded-2xl flex items-center justify-center shadow-lg">
              <span className="text-white font-bold text-lg">A</span>
            </div>
            <div className="hidden md:block">
              <p className="text-sm font-bold text-gray-900">Admin User</p>
              <p className="text-xs text-gray-500 font-medium">Maharashtra FPO</p>
            </div>
            <div className="w-2 h-2 bg-green-400 rounded-full animate-pulse"></div>
          </div>
        </div>
      </div>
    </header>
  )
}