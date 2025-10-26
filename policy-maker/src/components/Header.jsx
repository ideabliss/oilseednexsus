import { useState } from 'react'

export default function Header({ setSidebarOpen }) {
  const [searchQuery, setSearchQuery] = useState('')

  return (
    <header className="bg-gradient-to-r from-white via-blue-50 to-green-50 shadow-xl border-b border-gray-200 backdrop-blur-sm">
      <div className="flex items-center justify-between px-6 py-4">
        <button
          className="lg:hidden p-3 rounded-2xl text-gray-600 hover:text-white hover:bg-gradient-to-r hover:from-blue-500 hover:to-green-500 transition-all duration-300 shadow-lg hover:shadow-xl transform hover:scale-110"
          onClick={() => setSidebarOpen(true)}
        >
          <span className="text-xl">☰</span>
        </button>

        <div className="flex-1 max-w-2xl mx-6">
          <div className="relative">
            <input
              type="text"
              placeholder="Search states, districts, crops, schemes..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="w-full pl-12 pr-6 py-4 bg-white/80 backdrop-blur-sm border-2 border-gray-200 rounded-2xl focus:ring-4 focus:ring-blue-500/20 focus:border-blue-500 transition-all duration-300 shadow-lg hover:shadow-xl text-gray-700 placeholder-gray-500 font-medium"
            />
            <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
              <div className="bg-gradient-to-r from-blue-500 to-green-500 p-2 rounded-xl">
                <span className="text-white text-lg">🔍</span>
              </div>
            </div>
          </div>
        </div>

        <div className="flex items-center space-x-4">
          <div className="hidden md:flex items-center bg-white/80 backdrop-blur-sm rounded-2xl px-4 py-2 shadow-lg border border-gray-200">
            <span className="text-2xl mr-2">🇮🇳</span>
            <div>
              <p className="text-sm font-bold text-gray-900">India</p>
              <p className="text-xs text-gray-500">National View</p>
            </div>
          </div>

          <button className="p-3 text-gray-600 hover:text-white hover:bg-gradient-to-r hover:from-orange-500 hover:to-red-500 rounded-2xl relative transition-all duration-300 shadow-lg hover:shadow-xl transform hover:scale-110 bg-white/80 backdrop-blur-sm border border-gray-200">
            <span className="text-xl">🚨</span>
            <span className="absolute -top-1 -right-1 w-6 h-6 bg-gradient-to-r from-red-500 to-pink-500 text-white text-xs rounded-full flex items-center justify-center font-bold shadow-lg animate-pulse">
              5
            </span>
          </button>

          <div className="flex items-center space-x-3 bg-white/80 backdrop-blur-sm rounded-2xl px-4 py-2 shadow-lg border border-gray-200">
            <div className="w-10 h-10 bg-gradient-to-r from-blue-500 to-green-500 rounded-2xl flex items-center justify-center shadow-lg">
              <span className="text-white font-bold text-lg">PM</span>
            </div>
            <div className="hidden md:block">
              <p className="text-sm font-bold text-gray-900">Policy Maker</p>
              <p className="text-xs text-gray-500 font-medium">Ministry of Agriculture</p>
            </div>
            <div className="w-2 h-2 bg-green-400 rounded-full animate-pulse"></div>
          </div>
        </div>
      </div>
    </header>
  )
}