import { Link, useLocation } from 'react-router-dom'

const navigation = [
  { name: 'Dashboard', href: '/', icon: '📊', gradient: 'from-blue-500 to-blue-600' },
  { name: 'Production Map', href: '/map', icon: '🗺️', gradient: 'from-green-500 to-green-600' },
  { name: 'Analytics', href: '/analytics', icon: '📈', gradient: 'from-purple-500 to-purple-600' },
  { name: 'Traceability', href: '/traceability', icon: '🔗', gradient: 'from-orange-500 to-orange-600' },
  { name: 'Financial', href: '/financial', icon: '💰', gradient: 'from-yellow-500 to-yellow-600' },
]

export default function Sidebar({ open, setOpen }) {
  const location = useLocation()

  return (
    <>
      {open && (
        <div className="fixed inset-0 z-40 lg:hidden">
          <div className="fixed inset-0 bg-black bg-opacity-60 backdrop-blur-sm" onClick={() => setOpen(false)} />
        </div>
      )}

      <div className={`fixed inset-y-0 left-0 z-50 w-72 bg-gradient-to-b from-white to-gray-50 shadow-2xl transform ${
        open ? 'translate-x-0' : '-translate-x-full'
      } transition-all duration-300 ease-in-out lg:translate-x-0 lg:static lg:inset-0 border-r border-gray-200`}>
        
        <div className="flex items-center justify-between h-20 px-6 bg-gradient-to-r from-green-600 via-blue-600 to-purple-600">
          <div className="flex items-center">
            <div className="w-12 h-12 bg-white rounded-2xl flex items-center justify-center shadow-lg">
              <span className="text-2xl">🏛️</span>
            </div>
            <div className="ml-4">
              <span className="text-white font-bold text-xl">Policy Maker</span>
              <p className="text-white/80 text-sm">Oilseed Mission</p>
            </div>
          </div>
          <button
            className="lg:hidden text-white/80 hover:text-white bg-white/20 rounded-lg p-2 transition-all duration-200"
            onClick={() => setOpen(false)}
          >
            ✕
          </button>
        </div>

        <nav className="mt-8 px-6">
          <ul className="space-y-3">
            {navigation.map((item) => {
              const isActive = location.pathname === item.href
              return (
                <li key={item.name}>
                  <Link
                    to={item.href}
                    className={`group flex items-center px-4 py-4 text-sm font-semibold rounded-2xl transition-all duration-300 transform hover:scale-105 ${
                      isActive
                        ? `bg-gradient-to-r ${item.gradient} text-white shadow-lg`
                        : 'text-gray-600 hover:bg-white hover:text-gray-900 hover:shadow-lg border border-transparent hover:border-gray-200'
                    }`}
                  >
                    <div className={`p-2 rounded-xl mr-4 transition-all duration-300 ${
                      isActive 
                        ? 'bg-white/20' 
                        : 'bg-gray-100 group-hover:bg-gray-200'
                    }`}>
                      <span className="text-xl">{item.icon}</span>
                    </div>
                    <div className="flex-1">
                      <span className="uppercase tracking-wide">{item.name}</span>
                    </div>
                    {isActive && (
                      <div className="w-2 h-2 bg-white rounded-full animate-pulse"></div>
                    )}
                  </Link>
                </li>
              )
            })}
          </ul>
        </nav>

        <div className="absolute bottom-0 left-0 right-0 p-6 bg-gradient-to-r from-gray-50 to-white border-t border-gray-200">
          <div className="flex items-center p-4 bg-white rounded-2xl shadow-lg border border-gray-100">
            <div className="w-12 h-12 bg-gradient-to-r from-green-400 to-blue-500 rounded-2xl flex items-center justify-center shadow-lg">
              <span className="text-white font-bold text-lg">IN</span>
            </div>
            <div className="ml-4 flex-1">
              <p className="text-sm font-bold text-gray-900">Government of India</p>
              <p className="text-xs text-gray-500 font-medium">Ministry of Agriculture</p>
            </div>
            <div className="w-3 h-3 bg-green-400 rounded-full animate-pulse"></div>
          </div>
        </div>
      </div>
    </>
  )
}